local valid_clients = redis.call('zrangebyscore', client_last_seen_key, (now - 10000), 'inf')
local client_queued = redis.call('hmget', client_num_queued_key, unpack(valid_clients))

local sum = 0
for i = 1, #client_queued do
  sum = sum + tonumber(client_queued[i])
end

return sum
