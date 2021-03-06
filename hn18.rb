#@author Matthew Moss

class Integer
   def happy?
      return false if zero?
      return false if (self ^ 4).zero?
      return true  if (self ^ 1).zero?
      to_s.split(//).inject(0) { |s,x| s + (x.to_i ** 2) }.happy?
   end
end

#test
require_relative "rqc"
#RubyQuiz 93
$memx=[]
prc2 = Proc.new {
|x|
tempArr = []
until x<=0 do tempArr << (x%10)**2; x=x/10 end
sum=0
for i in 0...(tempArr.size) do sum +=tempArr[i] end
if sum==1 then $memx=[];true elsif $memx.include?(sum) then false else $memx<<sum;prc2.call(sum) end
}
RQC.qc(Fixnum)
$prm_generators[0].instance_variable_set(:@domain, 0..((2**(0.size * 8 - 2) -1)))
10000.times {p RQC.qc {|fix| p "#{fix.happy?} case:"; prc2.call(fix)==fix.happy? }}
