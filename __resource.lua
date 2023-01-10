client_script '@X.Brain/Shared/xGuardPlayer.lua'
server_script '@X.Brain/Shared/xGuardServer.lua'

--| 🐌	@ NATCHKUNG DEV			
--| 💬	@ »ღ«#8480


resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

description 'natchkung_bodywrap'

version '1.1'

ui_page "html/ui.html"

client_scripts {
  "config.lua",
  "client/main.lua"
}

server_script {

  '@mysql-async/lib/MySQL.lua',
  "config.lua",
  "server/server.lua"
}

files {
  "stream/deadbug.ydr",
  "stream/aimpsob.ydr",
  "stream/aimpsob.ytd",
  "html/*"
}

data_file "DLC_ITYP_REQUEST" "stream/deadbug.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/aimpsob.ytyp"
