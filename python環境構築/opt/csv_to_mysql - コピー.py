import json
import mysql.connector
import boto3
import pandas
from io import StringIO

# バケット名,オブジェクト名のメモ
# BUCKET_NAME = 'el-iotree-test'
# OBJECT_KEY_NAME = 'data/data.csv'

# S3取得
s3_client = boto3.client('s3')

def lambda_handler(event, context):
    # TODO implement

    # バケット名,オブジェクト名を取得
    BUCKET_NAME = event['Records'][0]['s3']['bucket']['name']
    OBJECT_KEY_NAME = event['Records'][0]['s3']['object']['key']

    # 引数を確認
    # print(json.dumps(event))
    
    # トリガー対象のオブジェクトを取得
    response = s3_client.get_object(Bucket=BUCKET_NAME, Key=OBJECT_KEY_NAME)
    
    # ファイルの中身を取り出す
    body = response['Body'].read()
    
    # csv形式で読み込み
    in_csv = pandas.read_csv(
                            StringIO(body.decode("cp932")),
                            encoding='cp932',
                            header=0
                             )
    
    # mysqlと接続 
    connect = mysql.connector.connect(user='test_user',
                                  password='password',
                                  host='172.31.37.166',
                                  port='33062',
                                  database='testdb',
                                  charset='utf8',
                                  ssl_disabled=True
                                  )
    
    # カーソルを取得
    cursor = connect.cursor()
    
    # 一行ずつ読む
    for index, row in in_csv.iterrows():
        # if row['場所コード'] == 'A-1':
        #     print(f"行 {index}: {row}")
        
        # insert処理開始
        
        insert_sql = f"""
            INSERT INTO testtable (
                    timestamp, 
                    syodo, 
                    temp, 
                    moi, 
                    soil_moi, 
                    pomp, placeCD
                    )
                values(
                    '{row['timestamp']}',
                    {row['照度']},
                    {row['温度（℃）']}, 
                    {row['湿度']}, 
                    {row['土壌湿度']}, 
                    {row['ポンプ稼働']},
                    '{row['場所コード']}'
                    )
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
        cursor.execute(insert_sql)
        # insert実行
        
        # コミット
        connect.commit()
    
    # # 結果取得
    # cursor.execute(f'select * from testtable;')
    
    # # 結果ロード
    # rows = cursor.fetchall()
    
    # print(rows)
    
    # コネクションクローズ
    connect.close()
    
    # return json.loads(body.decode('cp932'))
    return {
        'statusCode': 200,
        # 'body': json.dumps('Hello from Lambda!'),
        # 'event': json.dumps(rows),
        # 'test': json.dumps(domain_file_data)
    }