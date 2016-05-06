# RasPi-FanController
Raspberry Piに取り付けた冷却ファンをGPIOからON/OFF制御するシェルスクリプト。

## 前提
GPIOの出力では、直接ファンを接続しても動作させることができません。  
RasPiに接続するファンは、トランジスタまたはリレー等を使いGPIOからの制御を可能にしておいてください。

## 設定
指定する箇所は3つ  
* `port="25"`  
* `max_temp=45000`  
* `min_temp=40000`  

上から順に、  
制御に使用するGPIOポート、ファンを回し始める温度、ファンを止める温度

### 注意
GPIOポートは、**ピン番号ではなくGPIO番号で指定**します。  
温度は指定したい温度の**1000倍の数値を指定**します。  
例えば40℃→40000  

## 使用
指定を済ませ保存したシェルスクリプトを実行すると、温度に応じてファンがON/OFFします。  
cronを使い数分おきに1回実行させるようにすることで、ファンの制御が可能になります。  
尚、このシェルスクリプトの動作には、**root権限が必要**です。cronの設定の際にもご注意ください。
