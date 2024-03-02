// 使用 Mock
import Mock from 'mockjs'

const data = Mock.mock({
    // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
    'swiper|4-8': [{
        swiperAlt  :'@ctitle',
        swiperSrc  :"@image('500x300', '#578bba', '#fff', 'jpg', 'Test Image')"
    }],
    'notice|2-4': [{
        noticeId     :"@cword(10,20)",
        noticeTitle	 :'@ctitle',
        noticeContent:'@csentence',
        status       :"@cword(10,20)",
    }],
    'message|4-8': [{
        messageId	    :"@cword(10,20)",
        messageTitle    :'@ctitle',
        messageIntro    :'@csentence',
        messageType	    :"@cword(10,20)",
        messageCover    :"@image('200x200', '#f00', '#fff', 'jpg', 'H')",
        messageContent  :'@csentence',
        status	        :"@cword(10,20)",
        sortId	        :"@cword(10,20)",
    }],
    'sort|4-8': [{
        sortId	  :"@cword(10,20)",
        sortTitle :'@ctitle',
        sortType  :"@cword(10,20)",
        status	  :"@cword(10,20)",
    }],
    'view|4-8': [{
        'reviewId|1-10' :1,
        reviewRoot	    :'@ctitle',
        reviewContent	:'@csentence',
        reviewRelevance	:"@cword(10,20)",
        status	        :"@cword(10,20)",
        messageId	    :"@cword(10,20)",
    }],
    'active|4-8': [{
        activeId	  :"@cword(10,20)",
        activeTitle	  :'@ctitle',
        activeIntro	  :"@cword(10,20)",
        activeCover	  :"@image('200x200', '#f00', '#fff', 'jpg', 'H')",
        activeContent :'@csentence',
        activeStart	  :'@date',
        activeEnd	  :'@date',
        activeAddress :"@cword(10,20)",
        status	      :"@cword(10,20)",
    }],
    'service|4-8': [{
        serveId	    :"@cword(10,20)",
        serveTitle  :'@ctitle',
        serveCover  :"@image('200x200', '#f00', '#fff', 'jpg', 'H')",
        serveDesc   :'@csentence',
        status	    :"@cword(10,20)",
    }],
    'elder|4-8': [{
        homeId       :'@cword(10,20)',
        homeTitle    :'@ctitle',
        homePrice    :'@cword(10,20)',
        homeCover	 :"@image('200x200', '#f00', '#fff', 'jpg', 'H')",
        homeAddress  :'@cword(10,20)',
        homeTag      :'@cword(10,20)',
        homeBedNum   :'@cword(10,20)',
        homeType     :'@cword(10,20)',
        homeNature   :'@cword(10,20)',
        homeArea     :'@cword(10,20)',
        homeSetup    :'@cword(10,20)',
        homeConnect  :'@cword(10,20)',
        homeLongitude:'@cword(10,20)',
        homeLatitude :'@cword(10,20)',
        homeIntro    :'@cword(10,20)',
        status       :'@cword(10,20)',
    }],
    'user|1': [{
        userId      :'@cword(10,20)',
        userAcc     :'@cword(10,20)',
        userPwd     :'@cword(10,20)',
        userName    :'@cword(10,20)',
        userSex     :'@cword(10,20)',
        userAge     :'@cword(10,20)',
        userIde     :'@cword(10,20)',
        userPhone   :'@cword(10,20)',
        userCity    :'@cword(10,20)',
        userAddress :'@cword(10,20)',
    }],
    'userActive|4-8': [{
        activeId	   :'@cword(10,20)',
        activeTitle	   :'@ctitle',
        activeIntro	   :'@cword(10,20)',
        activeCover	   :"@image('200x200', '#f00', '#fff', 'jpg', 'H')",
        activeContennt :'@csentence',
        activeStart	   :'@cword(10,20)',
        activeEnd	   :'@cword(10,20)',
        activeAddress  :'@cword(10,20)',
        status	       :'@cword(10,20)',
    }],
    'userServe|4-8': [{
        serveId     :'@cword(10,20)',
        serveTitle  :'@ctitle',
        serveCover  :"@image('200x200', '#f00', '#fff', 'jpg', 'H')",
        serveDesc   :'@csentence',
        status      :'@cword(10,20)',
    }],
})

Mock.mock('/api/swiper/list', 'post', () => {
    return data.swiper
})
Mock.mock('/api/message/list', 'post', () => {
    return data.message
})
Mock.mock('/api/sort/list', 'post', () => {
    return data.sort
})
Mock.mock('/api/review/list', 'post', () => {
    return data.view
})
Mock.mock('/api/active/list', 'post', () => {
    return data.active
})
Mock.mock('/api/service/list', 'post', () => {
    return data.service
})
Mock.mock('/api/elder/list', 'post', () => {
    return data.elder
})
Mock.mock('/api/user/list', 'post', () => {
    return data.user
})
Mock.mock('/api/userActive/list', 'post', () => {
    return data.userActive
})
Mock.mock('/api/userServe/list', 'post', () => {
    return data.userServe
})


// const swiperList = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|4-8': [{
//         alt: 'Test+Image',
//         src: "@image('500x300', '#578bba', '#fff', 'jpg', 'Test Image')"
//     }],
//     'lst|4-8': [{
//         alt: 'Test+Image',
//         src: "@image('500x300', '#578bba', '#fff', 'jpg', 'Test Image')"
//     }]
// })
// Mock.mock('/api/swiper/list', 'get', () => {
//     return swiperList.list
// })
//
// const newsList = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|9': [{
//         time: '@date("yyyy-MM-dd HH:mm:ss")',
//         text: '@cword(10,20)'//Mock.Random.cparagraph(2),
//     }]
// })
// Mock.mock('/api/news/list', 'get', () => {
//     return newsList.list
// })
//
// // const home_hotNews = Mock.mock({
// //     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
// //     'list|9': [{
// //         time: '@date("yyyy-MM-dd HH:mm:ss")',
// //         text: '@cword(10,20)'//Mock.Random.cparagraph(2),
// //     }]
// // })
// // Mock.mock('/api/home/hotNews', 'get', () => {
// //     return home_hotNews.list
// // })
//
// const sorts = ['全部',
//     '养老动态',
//     '养老政策',
//     '养老服务',
//     '养老产业',
//     '养老模式',
//     '养老金',
//     '居家养老']
// for (let i = 0; i < sorts.length; i++) {
//     const newsSort = Mock.mock({
//         // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//         'list|5': [{
//             src: `@image('20x20', '#578bba', '#fff', 'jpg','H')`,
//             time: '@date("yyyy-MM-dd HH:mm:ss")',
//             text: '@cword(10,20)',//Mock.Random.cparagraph(2),
//             tag: '@cword(2,4)',
//             'read|1-100': 1
//         }]
//     })
//     Mock.mock('/api/news/list/' + sorts[i], 'get', () => {
//         return newsSort.list
//     })
// }
//
//
// // ///home/active
// // const activeList = Mock.mock({
// //     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
// //     'list|6': [{
// //         src: `@image('20x20', '#578bba', '#fff', 'jpg','F')`,
// //         time: '@date("yyyy-MM-dd HH:mm:ss")',
// //         text: '@cword(10,20)'//Mock.Random.cparagraph(2),
// //     }]
// // })
// // Mock.mock('/api/active/list', 'get', () => {
// //     return activeList.list
// // })
// //
//
// //
// //
// //===========================================================================
// // /active/list
// const activeList = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|6': [{
//         src: `@image('200x140', '#578bba', '#fff', 'jpg','公益活动')`,
//         start: '@date("yyyy-MM-dd")',
//         end: '@date("yyyy-MM-dd")',
//         intro: '@cword(16,25)',
//     }]
// })
// Mock.mock('/api/active/list', 'get', () => {
//     return activeList.list
// })
//
// //===========================================================================
// ///serve/list
// const serve_list = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|9': [{
//         src: `@image('200x140', '#578bba', '#fff', 'jpg','养老服务')`,
//         title: '@cword(5,9)',
//         intro: '@cword(16,25)',
//     }]
// })
// Mock.mock('/api/serve/list', 'get', () => {
//     return serve_list.list
// })
//
//
// //===========================================================================
// ///elder/list
// const elder_list = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|7': [{
//         src: `@image('200x140', '#578bba', '#fff', 'jpg','养老院')`,
//         title: '@cword(5,9)',
//         'price|2000-3500': 1
//     }]
// })
// Mock.mock('/api/elder/list', 'get', () => {
//     return elder_list.list
// })
//
//
// //===========================================================================
// // /mine/myself
// const mine_myself = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|1': [{
//         name: '@cname',
//         'account|18300000000': 1,
//         address: '@city(true)',
//         city: '@city(true)',
//         'phone|18300000000': 1,
//         ide: '@ctitle(3)',
//     }]
// })
// Mock.mock('/api/mine/myself', 'get', () => {
//     return mine_myself.list
// })
//
// ///mine/active
// const mine_active = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|7': [{
//         name: '@cword(5,15)',
//         'phone|18300000000': 1,
//         advance: '@cword(6,9)',
//         date: '@date', // 年-月-日
//         'state|-1-1': 1
//     }]
// })
// Mock.mock('/api/mine/active', 'get', () => {
//     return mine_active.list
// })
//
// // /mine/serve
// const mine_serve = Mock.mock({
//     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
//     'list|7': [{
//         name: '@cword(5,15)',
//         advance: '@cword(0,3)',
//         date: '@date("yyyy-MM-dd HH:mm:ss")',
//         'state|-1-1': 1
//     }]
// })
// Mock.mock('/api/mine/serve', 'get', () => {
//     return mine_serve.list
// })


