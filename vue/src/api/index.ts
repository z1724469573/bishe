import * as common from '@/api/common'
import * as swiper from '@/api/swiper'
import * as news from '@/api/news'
import * as sort from '@/api/sort'
import * as review from '@/api/review'
import * as active from '@/api/active'
import * as apply from '@/api/apply'
import * as serve from '@/api/serve'
import * as order from '@/api/order'
import * as elder from '@/api/elder'
import * as user from '@/api/user'
import * as notice from '@/api/notice'

// interface api { home: typeof home; }
// export default { home, } as api;

const api = {
    common, swiper, news, sort, review, active, apply, serve,
    order, elder, user, notice
}

export default api;