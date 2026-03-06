--[[
    Aprs4G by BG2LBF - 主文件
]]
PROJECT = "Aprs4G"
VERSION = "1.0.49"
PRODUCT_KEY = "hx9Cu1lPzbTTvtJXK3URBYQL8ybRcWU0"    -- 该产品key是air780epm定位器升级使用，非该型号请务必修改  A3XRK5vmXHrlYgeJTO6D2cbZMMiiq1ez   vn9j7SkLAjkbY3EXs5EXWwLsdX2Ybq0o

log.info("main", PROJECT, VERSION, mobile.imei())


_G.sys = require("sys")
_G.sysplus = require("sysplus")
require "ota"
require "cfg"
require "wdts"
require "led"
require "adcs"
-- require "audioctl"
require "powerctl"
require "webcmd"
require "smscmd"
require "nets"
require "traccar"
require "lbs"
require "pos"
require "posfix"
require "msg"
require "attitude"
require "timedstart"
require "shici"
require "mqtts"
require "mixloc"

pm.ioVol(pm.IOVOL_ALL_GPIO, 3300)
gpio.setup(22, 1)

-- mobile.simid(0)  -- 切换sim卡
sys.taskInit(function ()
    -- mobile.rtime(3, nil, true)
    sys.wait(500)
    mobile.setAuto(6000, 0, 3, true, 60000)
    sys.wait(5000)
    local cpin_is_ready = false
    while not cpin_is_ready do
        cpin_is_ready = mobile.simPin()
        log.info("cpin_is_ready", cpin_is_ready)  
        sys.wait(5000)
    end
end)
-- 用户代码已结束---------------------------------------------
-- 结尾总是这一句
sys.run()
-- sys.run()之后后面不要加任何语句!!!!!