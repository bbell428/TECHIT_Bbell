var tutor: String = "Ned"

// 값 타입을 매번 복사할 때마다
// 새로운 메모리 공간을 확보해서 할당하면
// 시간이 필요할 것이다
var tutor2: String = tutor

// Swift에서는 내부에서 지능적으로
// 처음 복사 할당할 경우엔 새로운 메모리를 확보해서 복사하지 않고
// 마치 참조타입처럼 작동하다가
// tutor/tutor2 어느 한쪽의 내용이 변경되면
// 그즈음에 실제로 새로운 메모리 확보/할당하는 복사 작업을 일으킨다 : LAZY
tutor2 = "Tuna"

print(tutor)
print(tutor2)
