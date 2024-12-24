import HomePage from "../pages/HomePage"
import PersonPage from "../pages/PersonPage"

@Component
export default struct TabView{

  @State currentIndex:number = 0


  //自定义tabs
  @Builder tarBuilder(title:string,targetIndex:number,selectedImg:Resource,Img:Resource){
    Column(){
      Image(this.currentIndex === targetIndex ? selectedImg : Img).size({ width : 28,height : 28 })
      Text(title).fontSize(14).fontColor(this.currentIndex === targetIndex ? '#f44444' : '#dfdfdf')
    }
    .width("100%")
    .height(60)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column(){
      Tabs({ barPosition:BarPosition.End }){
        TabContent(){
          Column(){
            HomePage()
          }
          .width("100%")
          .height("100%")
          .backgroundColor("#f3f4f5")
        }.tabBar(this.tarBuilder("首页",0,$r("app.media.home_selected"),$r("app.media.home_default")))
        TabContent(){
          Column(){
            PersonPage()
          }
          .width("100%")
          .height("100%")
          .backgroundColor("#f3f4f5")
        }.tabBar(this.tarBuilder("人才",1,$r("app.media.person_selected"),$r("app.media.person_default")))
        TabContent(){
          Column(){
            Text("我的内容")
          }
          .width("100%")
          .height("100%")
          .backgroundColor("#f3f4f5")
        }.tabBar(this.tarBuilder("我的",2,$r("app.media.mine_selected"),$r("app.media.mine_default")))
      }
      .backgroundColor("#ffffff")
      .onChange((index:number) =>{
        this.currentIndex = index
      })
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f3f4f5")
    .alignItems(HorizontalAlign.Center)
  }
}