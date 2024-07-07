# CSVファイルを読み書きするため、標準ライブラリcsvを使用する。
import csv
# MySQLの操作
import mysql.connector

import socket
import ssl
import os

# context = ssl.create_default_context()

# sock = socket.create_connection(('host.docker.internal', 3306))
# sock = context.wrap_socket(sock, server_hostname='host.docker.internal')

# フォルダパスを指定
# data_folder_path = "./data/row"
# chk_folder_path = "./data/chk"
data_folder_path = "C:/Users/akira.ohira/Documents/ローカル作業用/05_docker/python環境構築/opt/data/row"
chk_folder_path = "C:/Users/akira.ohira/Documents/ローカル作業用/05_docker/python環境構築/opt/data/chk"

# ファイル名を取得
files = os.listdir(data_folder_path)

print("ファイル名:", files)

#自分のローカルのMysqlへの接続　passwdには先ほど設定したrootのパスを入力
#ホストのmysql
# connect = mysql.connector.connect(user='root',
#                                   password='MySakira0299',
#                                   host='host.docker.internal',
#                                   port='3306',
#                                   database='testdb',
#                                   charset='utf8',
#                                 #   ssl_context=context,
#                                   ssl_disabled=True
#                                   )
#garafana 同じホストの別のコンテナに接続したいときはhost.docker.internalでホストに戻ってから接続　TLSの問題あり★
connect = mysql.connector.connect(user='root',
                                  password='root',
                                  host='host.docker.internal',
                                  port='33062',
                                  database='grafana_db',
                                  charset='utf8',
                                #   ssl_context=context,
                                  ssl_disabled=True
                                  )
#connect = mysql.connector.connect(user='root',password='MySakira0299',host='host.docker.internal',port='3306',database='testdb',charset='utf8')
cursor = connect.cursor()

#テーブルの作成（今回項目列名は下記で読み込むCSVの項目別変数と同一のものを使用している。桁数は適当。）
cursor.execute(f'drop table if exists grafana_db.testtb2;')

cursor.execute(f'create table testtb2 (timestamp timestamp,syodo int(10),temp int(7),moi int(7),soil_moi int(7),pomp boolean,placeCD varchar(10),PRIMARY KEY(timestamp,placeCD));')

for target_file in files:
    print("ファイル名:", target_file)

for target_file in files:
    chk_count = 0
    if os.path.isfile(f'{chk_folder_path}/dbchkfile_{target_file}'):
        with open(f'{chk_folder_path}/dbchkfile_{target_file}', 'r', encoding='cp932') as chkfile:
            for line in chkfile:
                chk_count = ++chk_count
    
    with open(f'{data_folder_path}/{target_file}', encoding='cp932') as infile, \
         open(f'{chk_folder_path}/dbchkfile_{target_file}', 'a', encoding='cp932') as chkfile:
        count = 0
        for line in infile:
            if chk_count > count:
                count = count + 1
                continue
            
            # 読み込んだ行の項目を順にカンマ区切りで対応する変数へ文字列としてmapする。
            timestamp, syodo, temp, moi, soil_moi, pomp, placeCD = map(str, line.split(','))
            if chk_count == 0:
                # 取得したレコードを外部出力。
                # エラーが出るため数値は文字へ一旦変換
                # row = {timestamp, syodo, temp, moi, soil_moi, pomp, placeCD}
                row_str = map(str,line.split(','))
                # 出力
                # print(','.join(list(row_str)))
                # print(line)
                print(','.join(list(row_str)), file=chkfile,end="")
                print(','.join(list(row_str)))
            
            if count > 0:
                # コンソール出力
                print(u"{}件目の処理を行っています".format(count))
                
                insert_sql = f"""
                INSERT INTO testtb2 (timestamp, syodo, temp, moi, soil_moi, pomp, placeCD)
                    values('{timestamp}', {syodo}, {temp}, {moi}, {soil_moi}, {pomp},'{placeCD}')
                    as new on duplicate key update
                        timestamp = new.timestamp,
                        syodo = new.syodo,
                        temp = new.temp,
                        moi = new.moi,
                        soil_moi = new.soil_moi,
                        pomp = new.pomp,
                        placeCD = new.placeCD
                ;
                """
                
                # MySQLDBへの格納出力(insert)。上記で読み込んで保持している変数の値をformatで突っ込むので、valuesの{}側をエスケープ\とシングルクオーテーション'で囲んでおく。
                cursor.execute(insert_sql)
                
                # 確認用に操作中テーブルからレコード取得
                cursor.execute(f'select * from testtb2 where timestamp=\'{timestamp}\' and placeCD=\'{placeCD}\';')
                rows = cursor.fetchall()

                # 取得したレコードを外部出力。
                for row in rows:
                    # エラーが出るため数値は文字へ一旦変換
                    row_str = map(str,row)
                    # 出力
                    print(','.join(list(row_str)), file=chkfile,end="")
                    print(','.join(list(row_str)))
                
                # insert処置後のcommitも。
                connect.commit()
            count = count + 1
        # 項目名列は処理対象の行としてカウントしない
        count = count - 1
        print(u'{} 件を処理しました。'.format(count))

# DB操作の終了。
cursor.close()
connect.close()