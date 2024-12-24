import { router } from "@kit.ArkUI"
import axios, { AxiosError, AxiosResponse } from "@ohos/axios"
import { RecommendGoodsObj } from "../entity/HttpResEntity"
import { HomeDetailsEntity } from "../entity/HomeDetailsEntity"

interface paramsObj{
  id:number
}

@Entry
@Component
struct HomeDetails {
  @State message: string = 'Hello World';

  @State goodsDetailsData:HomeDetailsEntity = {}

  aboutToAppear(): void {
    const params:paramsObj = router.getParams() as paramsObj
    axios.get<RecommendGoodsObj<HomeDetails>,
    AxiosResponse<RecommendGoodsObj<HomeDetails>>,
    null>(`http://iwenwiki.com:3006/api/goods/details?id=${ params.id }`)
      .then((res:AxiosResponse) =>{
        if (res.data.status === 200) {
          this.goodsDetailsData = res.data.data
        }
      })
      .catch((err:AxiosError) =>{
        console.log("axios-err",JSON.stringify(err))
      })
  }

  build() {
   Column(){
     Image(this.goodsDetailsData.image).width("100%")
     Text("价格:"+this.goodsDetailsData.price)
       .fontSize(24)
   }
  }
}