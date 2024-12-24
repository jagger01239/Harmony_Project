
interface iGrid{
  text:string;
  icon:Resource;
}

@Component
export default struct NavsView{

  @State gridData:iGrid[] = [
    {
      text:"出租转让",
      icon:$r("app.media.nav1")
    },
    {
      text:"求职招聘",
      icon:$r("app.media.nav2")
    },
    {
      text:"流行产品",
      icon:$r("app.media.nav3")
    },
    {
      text:"培训课程",
      icon:$r("app.media.nav4")
    },
    {
      text:"批发进货",
      icon:$r("app.media.nav5")
    },
  ]

  @Builder gridItemView(text:string,icon:Resource){
    GridItem(){
      Column(){
        Image(icon)
          .width(45)
        Text(text).padding({ top:10 })
      }
    }
  }

  build() {
    Column(){
      // Grid布局 等比例摆放布局
      Grid(){
        ForEach(this.gridData,(item:iGrid) =>{
          this.gridItemView(item.text,item.icon)
        })
      }
      .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
      .rowsGap(15)
    }
    .width("100%")
    .height(100)
    .padding({ top:10,bottom:5,right:5,left:5})
    .backgroundColor("#fff")
  }
}