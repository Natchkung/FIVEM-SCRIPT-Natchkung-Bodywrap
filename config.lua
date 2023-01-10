--| 🐌	@ NATCHKUNG DEV			
--| 💬	@ »ღ«#8480

Config = {}
Config.body = {}

-- Default ( ทั่วไป ) -- 
Config.body.Item = 'shroud' -- Item ( ไอเทม ) ที่ใช้ในการเริ่มใช้งาน ( กดใช้ )
Config.body.count = 1
Config.body.prop = 'aimpsob' -- Prop ( พร๊อพ ) ศพ ที่ต้องการใส่ ใช้ Addon ได้

Config.body.Needcop = 1  -- ตำรวจเท่าไหร่ถึงจะห่อได้
Config.body.Needmc = 1  -- หทอเท่าไหร่ถึงจะห่อได้
Config.body.Text = {
    nocopandmc = 'ต้องมีตำรวจ จำนวน '..Config.body.Needcop..'และ หมอ จำนวน '..Config.body.Needmc..' ขึ้นไป', -- แจ้งเตือนตำรวจไม่ครบ
} 

-- Progress ( หลอดโหลด ) -- 
Config.body.progress = 'mythic_progbar:client:progress' -- หลอดโหลดที่ใช้อยู่
Config.body.timeprogress = 7000 -- เวลาตอนห่อหลอดโหลด ( เวลา 1000 = 1 วินาที )
Config.body.textprogress = 'กำลังมัดและปิดตา' -- ข้อความตอนห่อหลอดโหลด

-- Animation ( อนิเมชั่นท่าทาง ) --
Config.body.animDict = 'anim@gangops@facility@servers@bodysearch@' -- หาได้ที่ https://alexguirre.github.io/animations-list/
Config.body.anim = 'player_search' -- หาได้ที่ https://alexguirre.github.io/animations-list/

-- Notify ( แจ้งเตือนตำรวจ ) --
Config.body.timesent = 10000 -- กดแจ้งได้ทุกกี่วินาที ( เวลา 1000 = 1 วินาที )
Config.body.gangnotify = {  -- ส่วนของการแจ้งเตือนแก๊ง
    alertNet = {
        Even = 'maxez-bodywrap:alertNet', -- แจ้งเตือนแก๊งแถบขวา ใช้ของใครก็ใส่ของค่ายนั้น
        category = 'dead'
    },
}

Config.body.policenotify = {  -- ส่วนของการแจ้งเตือนตำรวจ
    alertNet = {
        Even = 'maxez-police:alertNet', -- แจ้งเตือนแถบขวา ใช้ของใครก็ใส่ของค่ายนั้น
        category = 'bodywrap'
    },
}


------------------------------------- เปล -------------------------------------------

Config.play = {}

Config.play.Item = 'play' -- เปล
Config.play.count = 1

-- Progress ( หลอดโหลด ) -- 
Config.play.progress = 'mythic_progbar:client:progress' -- หลอดโหลดที่ใช้อยู่
Config.play.timeprogress = 7000 -- เวลาตอนห่อหลอดโหลด ( เวลา 1000 = 1 วินาที )
Config.play.textprogress = 'กำลังใส่เปล' -- ข้อความตอนห่อหลอดโหลด

-- Animation ( อนิเมชั่นท่าทาง ) --
Config.play.animDict = 'anim@gangops@facility@servers@bodysearch@' -- หาได้ที่ https://alexguirre.github.io/animations-list/
Config.play.anim = 'player_search' -- หาได้ที่ https://alexguirre.github.io/animations-list/

Config.play.Text = 'คุณไม่มีไอเทม '..Config.play.Item..' '
