wifi.setmode(wifi.SOFTAP)

cfg = {}
cfg.ssid = "ESP8266-GPIO_Test"
cfg.pwd = "12345678"
wifi.ap.config(cfg)

print(wifi.ap.getip())

led1 = 3
led2 = 4

gpio.mode(led1, gpio.OUTPUT)
gpio.mode(led2, gpio.OUTPUT)

srv = net.createServer(net.TCP)
srv: listen(80, function(conn)
	conn:on("receive", function(client, request)
		local buffer = "";
		local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
		if(method == nil) then
			for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
				_GET[k] = v
			end
		end
		buffer = buffer.."<h1> ESP8266 Web Server</h1>";
		buffer = buffer.."<p>GPIO0 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
		buffer = buffer.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
		local _on,_off = "",""
		if(_GET.pin == "ON1")then
			gpio.write(led1, gpio.HIGH);
			print("GPIO0 is high")
		elseif(_GET.pin == "OFF1")then
			gpio.write(led1, gpio.LOW);
			print("GPIO0 is LOW")
		elseif(_GET.pin == "ON2")then
			gpio.write(led2, gpio.HIGH);
		elseif(_GET.pin == "OFF2")then
			gpio.write(led2, gpio.LOW);
		end
		client:send(buffer);
		client:close();
		collectgarbage();
	end)
end)
