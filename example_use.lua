local pidcontrollers = require "lib.pidcontrollers"

local P = 0.15
local I = 0
local D = 0.1

--used for integral clamping--
local minimum_value = 0 
local maximum_value = 15 --redstone
--used for integral clamping--

local continuous_scalar_pid = pidcontrollers.PID_Continuous_Scalar(P, I, D, minimum_value ,maximum_value)
local continuous_vector_pid = pidcontrollers.PID_Continuous_Vector(P, I, D, minimum_value ,maximum_value)

--use discrete pids for slower sample rates--
local slow_sample_rate = 0.3
local discrete_scalar_pid = pidcontrollers.PID_Discrete_Scalar(P, I, D, minimum_value ,maximum_value,slow_sample_rate)
local discrete_vector_pid = pidcontrollers.PID_Discrete_Vector(P, I, D, minimum_value ,maximum_value,slow_sample_rate)
--use discrete pids for slower sample rates--

local error_value = 69
local error_value_vec = vector.new(4,2,0)

while true do
	--[[
	pid_value = continuous_scalar_pid:run(error_value)
	pid_value_vec = continuous_vector_pid:run(error_value_vec)
	
	print("cont_val: ",pid_value)
	print("cont_vec: ",pid_value_vec:tostring())
	
	os.sleep(0)
	]]--
	
	pid_value = discrete_scalar_pid:run(error_value)
	pid_value_vec = discrete_vector_pid:run(error_value_vec)
	
	print("disc_val: ",pid_value)
	print("disc_vec: ",pid_value_vec:tostring())
	
	os.sleep(slow_sample_rate)
end
