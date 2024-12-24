import SearchView from "../views/homeview/SearchView"
import SwiperView from "../views/homeview/SwiperView"
import Marquee from "../views/homeview/MarqueeView"
import NavsView from "../views/homeview/NavsView"

@Entry
@Component
export default struct HomePage{
  build() {
    Column(){
      SearchView()
      SwiperView()
      Marquee()
      NavsView()
    }
  }
}