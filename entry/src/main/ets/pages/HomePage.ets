import SearchView from "../views/homeview/SearchView"
import SwiperView from "../views/homeview/SwiperView"
import Marquee from "../views/homeview/MarqueeView"
import NavsView from "../views/homeview/NavsView"
import RecommendGoodsView from "../views/homeview/RecommendGoodsView"

@Entry
@Component
export default struct HomePage{
  build() {
    Column(){
      SearchView()
      List(){
        ListItem(){
          Column(){
            SwiperView()
            Marquee()
            NavsView()
            RecommendGoodsView()
          }
        }
      }
    }
  }
}