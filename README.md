# TimeClock
Vivado 2020.1에서 Verilog를 이용한 시계 기능을 구현하는 코드

## Ver 1. TimeClock
모드 스위치를 조작함에 따라 FND에 Hour, Min 및 Sec, Msec 출력 

## 1. 동작 원리
1) mode SW = 0(OFF) --> FND에 Hour Hour Min Min display  
2) mode SW = 1(ON) --> FND에 Sec Sec Msec Msec display

## 2. RTL Analysis
### [TimeClock]

### ClockDivider_Digit

## 3. Simulation Result

## 4. 동작 영상


## Ver 2. TimeClock & FNDDPBlink
Ver 1의 TimeClock에 FND의 DP부분이 깜빡거리는 것을 추가

## 1. 동작 원리
0.5초씩 간격으로 100의 자리 FND_DP가 깜빡거림 (1초가 늘어나는 순간 DP가 ON)

## 2. RTL Analysis
### [TimeClock]