require 'rdl'

class QC
	extend RDL
	
	keyword :qc do |x|
		
		puts "hi#{x}"
		#num_cases = 100
		
		action{|x| puts x}
		
		dsl do
			
			keyword :constrain do
				#Set generation constraints
				pre_task { |x| puts "pre" }
				action { |x| puts "#{x}\n\n" }
				post_task { |x,ret| puts "post" }

#				action do |x|
#					puts x
#				end
					
#				dsl do
					
#					keyword :from do
					
#					end
					
#					keyword :to do
					
#					end
						
#					keyword :with do
						
#					end
						
#				end
			end
				
			keyword :check do
				#Set post conditions to check
				action{|y| puts y}
			end
				
			keyword :times do
				action{|x| num_cases = x.to_i}
				post_task{puts num_cases}
			end
			
		end
	end
end


a = QC.new
a.qc {constrain ["hello","hi"]}










