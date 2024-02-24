# CSVファイルを読み書きするため、標準ライブラリcsvを使用する。
import csv
# MySQLの操作
import mysql.connector

import socket
import ssl

# context = ssl.create_default_context()

# sock = socket.create_connection(('host.docker.internal', 3306))
# sock = context.wrap_socket(sock, server_hostname='host.docker.internal')

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
#garafana
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
cursor.execute('create table testtbl ({} char(10) PRIMARY KEY,{} varchar(20),{} int(8),{} int(1),{} int(7),{} varchar(60),{} varchar(60),{} int(8),{} int(8),{} int(8),{} int(1),{} int(1),{} int(8));'.format('number', 'name', 'birthymd', 'sex', 'post', 'adr1', 'adr2', 'ymd_sinsei', 'ymd_nintei', 'ymd_happu', 'types', 'pet', 'ymd_test'))

with open('infile.csv', encoding='cp932') as infile, \
    open('dbchkfile.csv', 'w', encoding='cp932') as chkfile:
    count = 0
    for line in infile:
        # 読み込んだ行の項目を順にカンマ区切りで対応する変数へ文字列としてmapする。
        number, name, birthymd, sex, post, adr1, adr2, ymd_sinsei, ymd_nintei, ymd_happu, types, pet, ymd_test = map(str, line.split(','))
        if count > 0:
            # MySQLDBへの格納出力(insert)。上記で読み込んで保持している変数の値をformatで突っ込むので、valuesの{}側をエスケープ\とシングルクオーテーション'で囲んでおく。
            cursor.execute('INSERT INTO testtbl (number,name,birthymd,sex,post,adr1,adr2,ymd_sinsei,ymd_nintei,ymd_happu,types,pet,ymd_test) values(\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\',\'{}\');'.format(number,name,birthymd,sex,post,adr1,adr2,ymd_sinsei,ymd_nintei,ymd_happu,types,pet,ymd_test))

            # コンソール出力
            print(u"{}人目の処理を行っています".format(count))
        count = count + 1
    # 項目名列は処理対象の行としてカウントしない
    count = count - 1
    print(u'{} 件を処理しました。'.format(count))

    # 確認用に操作中テーブルからレコード取得
    cursor.execute('select * from testtbl;')
    rows = cursor.fetchall()

    # 取得したレコードを外部出力。
    for row in rows:
        # エラーが出るため数値は文字へ一旦変換
        row_str = map(str,row)
        # 出力
        print(','.join(list(row_str)), file=chkfile)

# DB操作の終了。
# insert処置後のcommitも。
cursor.close()
connect.commit()
connect.close()