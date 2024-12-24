export class RecommendGoods<T>{
  status?:number;
  data?:T[]
}

export class RecommendGoodsObj<T>{
  status?:number;
  data?:T
}

export class CommonEntity<T>{
  status?:number;
  data?:T[]
}

//该数据类型使用的地方较多，故写成一个单独的类一共后续不同页面接受数据的公共部分
//泛型