
@Component
export default struct MarqueeView{

  @State start:boolean = true
  @State src:string = "年会不能错过的款，全场最亮的星就是你！美呆了~"
  private step:number = 2
  private loop:number =Number.POSITIVE_INFINITY
  private fromStart:boolean = true



  build() {
    Column(){
      Row(){
        Text("美甲咨询")
          .padding({ right:10 })
          .margin({ right:10 })
          .fontColor("#999")
          .border({
            width:{right:1},
            color:{ right:"#f3f4f5"}
          })
        Marquee({
          start:this.start,
          step:this.step,
          loop:this.loop,
          src:this.src,
          fromStart:this.fromStart
        })
          .margin({ right:10})
      }
    }
    .width("100%")
    .height(40)
    .justifyContent(FlexAlign.Center)
    .backgroundColor("#ffffff")
    .padding({ left:10,right:10})
    .border({ width:{top:1}, color:{top:"#f3f4f5"} })
    .margin({ top:2,bottom:2 })
  }

}