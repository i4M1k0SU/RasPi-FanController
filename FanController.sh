#!/bin/bash

#制御に使用するGPIOポート
port="25"

#温度の指定は1000倍（40℃→40000）
#この値を超えた時ファンを回す
max_temp=45000
#この値を下回った時ファンと止める
min_temp=40000

#温度の取得
let temp=`cat /sys/class/thermal/thermal_zone0/temp`

#GPIOが開いているか確認
#開いてない場合に開く
if [ ! -f "/sys/class/gpio/gpio${port}/value" ]
then
	echo ${port} > /sys/class/gpio/export
	echo out > /sys/class/gpio/gpio$port/direction
fi

#指定の温度を上回った時作動
if [ $temp -gt $max_temp ] ; then
	echo 1 > /sys/class/gpio/gpio$port/value
#指定の温度を下回った時停止
elif [ $temp -lt $min_temp ] ; then
	echo 0 > /sys/class/gpio/gpio$port/value
fi

