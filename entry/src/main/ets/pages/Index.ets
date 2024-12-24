import TabsView from "../components/TabsView"


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
   Column(){
      TabsView()
   }
   .backgroundColor("#f3f4f5")
   .height('100%')
   .width('100%')
  }
}