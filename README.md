# TimeClock
Vivado 2020.1에서 Verilog를 이용한 시계 기능을 구현하는 코드

## Ver 1. TimeClock
모드 스위치를 조작함에 따라 FND에 Hour, Min 및 Sec, Msec 출력 

## 1. 동작 원리
1) mode SW = 0(OFF) --> FND에 Hour Hour Min Min display  
2) mode SW = 1(ON) --> FND에 Sec Sec Msec Msec display

## 2. RTL Analysis
### [TimeClock - Top Module]
![Ver 1  TimerCount RTL](https://user-images.githubusercontent.com/113006133/195368063-e5a0a1a5-8c70-4eb9-8ffc-1627fbb5af5f.JPG)

### [ClockDivider_Digit]
![Ver 1  ClockDivider_Digit RTL](https://user-images.githubusercontent.com/113006133/195368187-da888cb9-0649-4579-ba93-7d2c8ab8cd36.JPG)

### [Counter_FND]
![Ver 1  Counter_FND RTL](https://user-images.githubusercontent.com/113006133/195368247-0c691598-d1ef-468b-b34e-372f921d4569.JPG)

### [Decoder_2x4]
![Ver 1  Decoder_2x4 RTL](https://user-images.githubusercontent.com/113006133/195368294-5ee7fb0f-96c6-4aa4-97ca-4f9e9d661386.JPG)

### ClockDivider_TimeClock
![Ver 1  ClockDivider_TimeClock RTL](https://user-images.githubusercontent.com/113006133/195368337-44401bd9-ea90-4f59-8742-aa8cc336ae88.JPG)

### [Counter_TimeClock]
![Ver 1  Counter_TimeClock RTL](https://user-images.githubusercontent.com/113006133/195368380-c6baf166-8109-4299-a829-0d3d976be68a.JPG)

### [digitDivider_HourMin]
![Ver 1  digitDivider_HourMin RTL](https://user-images.githubusercontent.com/113006133/195368423-c7d215cc-3ad6-4c18-a87d-03150f2aefc6.JPG)

### [digitDivider_SecMsec]
![Ver 1  digitDivider_SecMsec RTL](https://user-images.githubusercontent.com/113006133/195368430-74b91c10-a91c-4eed-b48d-c2f20c116772.JPG)

### [MUX_4x1]
![Ver 1  MUX_4x1 RTL](https://user-images.githubusercontent.com/113006133/195368535-bdcc4297-dd85-47d2-be6a-c4421be66a94.JPG)

### [MUX_2x1]
![Ver 1  MUX_2x1 RTL](https://user-images.githubusercontent.com/113006133/195368553-e07e600c-10c8-4cbc-9afa-d9fcdd56c5f5.JPG)

### [BCDToFND_Decoder]
![Ver 1  BCDToFND_Decoder RTL](https://user-images.githubusercontent.com/113006133/195368598-39f8af0d-481a-4b2c-8f56-837c1e98dbfc.JPG)

## 3. Simulation Result
![Ver 1  Simulation Result](https://user-images.githubusercontent.com/113006133/195368684-7832230c-4030-40b4-9365-d855b3b99d6d.JPG)

## 4. 동작 영상

https://user-images.githubusercontent.com/113006133/195368744-9dfbf3ca-24e0-4ae0-a958-b8f6a8b87ab7.mp4

## Ver 2. TimeClock & FNDDPBlink
Ver 1의 TimeClock에 FND의 DP부분이 깜빡거리는 것을 추가

## 1. 동작 원리
0.5초씩 간격으로 100의 자리 FND_DP가 깜빡거림 (1초가 늘어나는 순간 DP가 ON)

## 2. RTL Analysis
### [TimeClock - Top Module]
![Ver 2  TimeClock RTL](https://user-images.githubusercontent.com/113006133/195369134-57960208-0dc4-4922-b11c-f22e629868c8.PNG)

### [Couunter_FND]
![Ver 2  Counter_FND RTL](https://user-images.githubusercontent.com/113006133/195369210-8d253319-3afc-41f3-b49d-e89075a919b3.PNG)

### [Decoder_3x4]
![Ver 2  Decoder_3x4 RTL](https://user-images.githubusercontent.com/113006133/195369236-e0a0c17f-4109-44f0-8c80-239e1add5d14.PNG)

### [Comparator]
![Ver 2  Comparator RTL](https://user-images.githubusercontent.com/113006133/195369257-861a1334-fcac-438b-8e87-505fd838a375.PNG)

### [MUX_8x1]
![Ver 2  MUX_8x1 RTL](https://user-images.githubusercontent.com/113006133/195369275-c39599be-b97e-4ca2-bdef-a79e50fa57fd.PNG)

## 3. Simulation Result
![Ver 2  Simulation Result](https://user-images.githubusercontent.com/113006133/195369351-42bdc1f1-f824-47fa-903a-9ec42e9d821f.PNG)

## 4. 동작 영상

https://user-images.githubusercontent.com/113006133/195368799-168a8a13-6f7c-4582-b2d3-d93e39203665.mp4

## Ver 3. TimeClock & FNDDPBlink & OnOff
Ver 2의 TimerClock & FNDDPBlink에 OnOff 버튼을 추가

## 1. 동작 원리
1) OnOffSW = 0 (OFF) --> FND에 정상적으로 출력
2) OnOffSW = 1 (ON) --> FND OFF

## 2. RTL Analysis
### [TimeClock - Top Module]
![Ver 3  TimeClock RTL](https://user-images.githubusercontent.com/113006133/195369409-e1b35695-5b92-4526-baa4-930ceafeb22e.PNG)

### [Decoder_3x4]
![Ver 3  Decoder_3x4 RTL](https://user-images.githubusercontent.com/113006133/195369420-6f48ba39-cc86-4cee-a9a5-d190c8f9dfed.PNG)

## 3. Simulation Result
![Ver 3  Simulation Result](https://user-images.githubusercontent.com/113006133/195369455-148b3f44-850b-4be3-b802-c67404d0a6e7.PNG)

## 4. 동작 영상

https://user-images.githubusercontent.com/113006133/195368950-98b9e412-5742-4a62-ae39-166ec6ad19fa.mp4