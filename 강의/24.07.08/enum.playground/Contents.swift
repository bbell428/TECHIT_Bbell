enum Temperature {
    case hot
    case cold
    case warm
}

var temp: Temperature = Temperature.cold
var temp2: Temperature = .hot // 많이 보는 경우
// var temp3 = .warm (이렇게는 안된다)
