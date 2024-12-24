import axios, { AxiosError, AxiosResponse } from "@ohos/axios"

interface bannerItem{
  image:string;
  title:string;
  url:string;
}


interface banner{
  status:number;
  data:bannerItem[]
}

@Component
export default struct SwiperView{

  @State bannerArr:bannerItem[] = []

  aboutToAppear(): void {
    axios.get<banner,AxiosResponse<banner>,null>("http://iwenwiki.com:3006/api/banner")
      .then((res:AxiosResponse) =>{
        if (res.data.status === 200) {
          this.bannerArr = res.data.data
        }
      })
      .catch((err:AxiosError) =>{
        console.log("axios-err",JSON.stringify(err))
      })
  }

  build() {
    Column(){
      Swiper(){
        ForEach(this.bannerArr,(item:bannerItem) =>{
          Image(item.image).width("100%")
        })
      }
      .loop(true)
      .autoPlay(true)
      .interval(4000)
    }
  }
}