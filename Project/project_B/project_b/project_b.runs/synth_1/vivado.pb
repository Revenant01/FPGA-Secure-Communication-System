
p
Command: %s
53*	vivadotcl2?
+synth_design -top TOP -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
190722default:defaultZ8-7075h px� 
�
%s*synth2�
wStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1077.090 ; gain = 0.000
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2
TOP2default:default2[
EC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/new/TOP.vhd2default:default2
452default:default8@Z8-638h px� 
b
%s
*synth2J
6	Parameter BAUD_RATE bound to: 10416 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
UART_RX32default:default2l
XC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/UART_RX3.vhd2default:default2
42default:default2
reciever2default:default2
UART_RX32default:default2[
EC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/new/TOP.vhd2default:default2
902default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
UART_RX32default:default2n
XC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/UART_RX3.vhd2default:default2
152default:default8@Z8-638h px� 
b
%s
*synth2J
6	Parameter BAUD_RATE bound to: 10416 - type: integer 
2default:defaulth p
x
� 
�
default block is never used226*oasys2n
XC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/UART_RX3.vhd2default:default2
312default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
UART_RX32default:default2
12default:default2
12default:default2n
XC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/UART_RX3.vhd2default:default2
152default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
Top_decryption2default:default2X
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
342default:default2

decryption2default:default2"
Top_decryption2default:default2[
EC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/new/TOP.vhd2default:default2
922default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2"
Top_decryption2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
412default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_12default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
562default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2$
Decryption_round2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
422default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
inv_shift_rows2default:default2X
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_shift_rows.vhd2default:default2
342default:default2"
shift_rows_map2default:default2"
inv_shift_rows2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
662default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2"
inv_shift_rows2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_shift_rows.vhd2default:default2
392default:default8@Z8-638h px� 
�
<shared variable will be implemented as local to architecture613*oasys2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_shift_rows.vhd2default:default2
402default:default8@Z8-613h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
inv_shift_rows2default:default2
22default:default2
12default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_shift_rows.vhd2default:default2
392default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
inv_sbox2default:default2T
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
392default:default8@Z8-638h px� 
�
default block is never used226*oasys2T
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
452default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
inv_sbox2default:default2
32default:default2
12default:default2T
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
392default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
inv_sbox2default:default2R
>C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_sbox.vhd2default:default2
342default:default2
sbox_map2default:default2
inv_sbox2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
702default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
inv_mix_columns2default:default2Y
EC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_mix_columns.vhd2default:default2
52default:default2#
mix_columns_map2default:default2#
inv_mix_columns2default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
802default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2#
inv_mix_columns2default:default2[
EC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_mix_columns.vhd2default:default2
102default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	mixMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
142default:default2
p12default:default2
	mixMultip2default:default2[
EC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_mix_columns.vhd2default:default2
492default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	mixMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
192default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p12default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
302default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
392default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	twoMultip2default:default2
42default:default2
12default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
392default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p22default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
322default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p32default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
342default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p42default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
362default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p52default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
372default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p62default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
382default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p72default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
412default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p82default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
432default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p92default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
442default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p102default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
472default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p112default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
482default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p122default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
502default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p132default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
552default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p142default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
562default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p152default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
582default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p162default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
612default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p172default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
632default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p182default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
652default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p192default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
672default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p202default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
682default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p212default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
692default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p222default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
722default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p232default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
742default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p242default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
752default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p252default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
792default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p262default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
812default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p272default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
822default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p282default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
852default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p292default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
862default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p302default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
882default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p312default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
912default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p322default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
932default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p332default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
952default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p342default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
982default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p352default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
992default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p362default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1002default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p372default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1042default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p382default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1052default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p392default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1062default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p402default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1092default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p412default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1112default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p422default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1122default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p432default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1152default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p442default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1162default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p452default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1182default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p462default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1212default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p472default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1232default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	twoMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/twoMultip.vhd2default:default2
342default:default2
p482default:default2
	twoMultip2default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
1252default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	mixMultip2default:default2
52default:default2
12default:default2U
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
192default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	mixMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
142default:default2
p22default:default2
	mixMultip2default:default2[
EC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_mix_columns.vhd2default:default2
502default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	mixMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
142default:default2
p32default:default2
	mixMultip2default:default2[
EC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_mix_columns.vhd2default:default2
512default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	mixMultip2default:default2S
?C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/mixMultip.vhd2default:default2
142default:default2
p42default:default2
	mixMultip2default:default2[
EC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_mix_columns.vhd2default:default2
522default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2#
inv_mix_columns2default:default2
62default:default2
12default:default2[
EC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/inv_mix_columns.vhd2default:default2
102default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2$
Decryption_round2default:default2
72default:default2
12default:default2V
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
422default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_22default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
572default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_32default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
582default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_42default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
592default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_52default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
602default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_62default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
612default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_72default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
622default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_82default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
632default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_92default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
642default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
Decryption_round2default:default2T
@C:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/decryption.vhd2default:default2
342default:default2
round_102default:default2$
decryption_round2default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
652default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
Top_decryption2default:default2
82default:default2
12default:default2Z
DC:/Users/shoro/Desktop/dec/dec.srcs/sources_1/new/Top_decryption.vhd2default:default2
412default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
VGA2default:default2g
SC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/VGA.vhd2default:default2
92default:default2
display12default:default2
VGA2default:default2[
EC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/new/TOP.vhd2default:default2
942default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
VGA2default:default2i
SC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/VGA.vhd2default:default2
232default:default8@Z8-638h px� 
�
synthesizing module '%s'638*oasys2!
Pixel_On_Text2default:default2s
]C:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Pixel_On_Text.vhd2default:default2
492default:default8@Z8-638h px� 
`
%s
*synth2H
4	Parameter textLength bound to: 16 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'638*oasys2
Font_Rom2default:default2n
XC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Font_Rom.vhd2default:default2
402default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Font_Rom2default:default2
92default:default2
12default:default2n
XC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Font_Rom.vhd2default:default2
402default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
Pixel_On_Text2default:default2
102default:default2
12default:default2s
]C:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Pixel_On_Text.vhd2default:default2
492default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
Clock_Divider2default:default2q
]C:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Clock_Divider.vhd2default:default2
52default:default2
CD2default:default2!
Clock_Divider2default:default2i
SC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/VGA.vhd2default:default2
1022default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2!
Clock_Divider2default:default2s
]C:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Clock_Divider.vhd2default:default2
102default:default8@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
tmp2default:default2s
]C:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Clock_Divider.vhd2default:default2
172default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
Clock_Divider2default:default2
112default:default2
12default:default2s
]C:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/Clock_Divider.vhd2default:default2
102default:default8@Z8-256h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
d12default:default2i
SC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/VGA.vhd2default:default2
1892default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
VGA2default:default2
122default:default2
12default:default2i
SC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/VGA.vhd2default:default2
232default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
TOP2default:default2
132default:default2
12default:default2[
EC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/new/TOP.vhd2default:default2
452default:default8@Z8-256h px� 
�
%s*synth2�
xFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1105.965 ; gain = 28.875
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1105.965 ; gain = 28.875
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1105.965 ; gain = 28.875
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:012default:default2 
00:00:00.3902default:default2
1105.9652default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2s
]C:/Users/shoro/Desktop/project_b/project_b.srcs/constrs_1/imports/Downloads/Basys3_Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2s
]C:/Users/shoro/Desktop/project_b/project_b.srcs/constrs_1/imports/Downloads/Basys3_Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2q
]C:/Users/shoro/Desktop/project_b/project_b.srcs/constrs_1/imports/Downloads/Basys3_Master.xdc2default:default2)
.Xil/TOP_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
1259.8552default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0392default:default2
1259.8552default:default2
0.0002default:defaultZ17-268h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1259.855 ; gain = 182.766
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1259.855 ; gain = 182.766
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1259.855 ; gain = 182.766
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2
UART_RX32default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                               00 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                   start |                               01 |                               01
2default:defaulth p
x
� 
�
%s
*synth2s
_                    data |                               10 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                    stop |                               11 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2

sequential2default:default2
UART_RX32default:defaultZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2

vgaRed_reg2default:default2i
SC:/Users/shoro/Desktop/project_b/project_b.srcs/sources_1/imports/Downloads/VGA.vhd2default:default2
1932default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:18 ; elapsed = 00:00:18 . Memory (MB): peak = 1259.855 ; gain = 182.766
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p12default:default2
	twoMultip2default:default2"
mixMultip:/p132default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p12default:default2
	twoMultip2default:default2"
mixMultip:/p252default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p12default:default2
	twoMultip2default:default2"
mixMultip:/p372default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p42default:default2
	twoMultip2default:default2"
mixMultip:/p162default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p42default:default2
	twoMultip2default:default2"
mixMultip:/p282default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p42default:default2
	twoMultip2default:default2"
mixMultip:/p402default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p72default:default2
	twoMultip2default:default2"
mixMultip:/p192default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p72default:default2
	twoMultip2default:default2"
mixMultip:/p312default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2!
mixMultip:/p72default:default2
	twoMultip2default:default2"
mixMultip:/p432default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2"
mixMultip:/p102default:default2
	twoMultip2default:default2"
mixMultip:/p222default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2"
mixMultip:/p102default:default2
	twoMultip2default:default2"
mixMultip:/p342default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2"
mixMultip:/p102default:default2
	twoMultip2default:default2"
mixMultip:/p462default:defaultZ8-223h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   33 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   31 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   14 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    7 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    5 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input    128 Bit         XORs := 11    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      8 Bit         XORs := 2560  
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      8 Bit         XORs := 160   
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              128 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               14 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                7 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 5     
2default:defaulth p
x
� 
8
%s
*synth2 
+---ROMs : 
2default:defaulth p
x
� 
P
%s
*synth28
$	                    ROMs := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  128 Bit        Muxes := 11    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  128 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   31 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   14 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   14 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 1440  
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    7 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 6     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 3     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:01:10 ; elapsed = 00:01:12 . Memory (MB): peak = 1259.855 ; gain = 182.766
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
M
%s*synth25
!
ROM: Preliminary Mapping	Report
2default:defaulth px� 
�
%s*synth2u
a+-----------------+-------------------------------------------+---------------+----------------+
2default:defaulth px� 
�
%s*synth2v
b|Module Name      | RTL Object                                | Depth x Width | Implemented As | 
2default:defaulth px� 
�
%s*synth2u
a+-----------------+-------------------------------------------+---------------+----------------+
2default:defaulth px� 
�
%s*synth2v
b|inv_sbox         | output_byte                               | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[0].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[1].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[2].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[3].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[4].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[5].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[6].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[7].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[9].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[10].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[11].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[13].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[15].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[0].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[1].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[2].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[3].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[4].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[5].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[6].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[7].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[8].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[9].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[11].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[13].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[0].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[2].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[3].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[10].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[11].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[0].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[9].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[13].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[15].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[2].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[3].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[4].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[5].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[6].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[7].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[8].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[9].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[10].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[11].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[0].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[1].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[2].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[5].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[6].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[7].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[9].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[10].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[13].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[13].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[15].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[1].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[2].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[3].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[4].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[6].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[8].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[9].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[10].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[11].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[13].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[15].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[0].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[1].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[5].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[8].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[11].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[0].sbox_map/output_byte   | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[12].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[13].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[14].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|Decryption_round | generate_sboxes[15].sbox_map/output_byte  | 256x8         | LUT            | 
2default:defaulth px� 
�
%s*synth2v
b|TOP              | display1/textElement1/fontRom/fontRow_reg | 2048x8        | Block RAM      | 
2default:defaulth px� 
�
%s*synth2v
b+-----------------+-------------------------------------------+---------------+----------------+

2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:17 ; elapsed = 00:01:20 . Memory (MB): peak = 1269.277 ; gain = 192.188
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:01:18 ; elapsed = 00:01:21 . Memory (MB): peak = 1278.352 ; gain = 201.262
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2=
)display1/textElement1/fontRom/fontRow_reg2default:default2
Block2default:defaultZ8-7052h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:01:21 ; elapsed = 00:01:24 . Memory (MB): peak = 1357.277 ; gain = 280.188
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:01:26 ; elapsed = 00:01:29 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:26 ; elapsed = 00:01:29 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:27 ; elapsed = 00:01:30 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:28 ; elapsed = 00:01:31 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:29 ; elapsed = 00:01:32 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:29 ; elapsed = 00:01:32 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|      |Cell     |Count |
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|1     |BUFG     |     1|
2default:defaulth px� 
F
%s*synth2.
|2     |CARRY4   |    15|
2default:defaulth px� 
F
%s*synth2.
|3     |LUT1     |     6|
2default:defaulth px� 
F
%s*synth2.
|4     |LUT2     |   807|
2default:defaulth px� 
F
%s*synth2.
|5     |LUT3     |   171|
2default:defaulth px� 
F
%s*synth2.
|6     |LUT4     |   219|
2default:defaulth px� 
F
%s*synth2.
|7     |LUT5     |   504|
2default:defaulth px� 
F
%s*synth2.
|8     |LUT6     |  8196|
2default:defaulth px� 
F
%s*synth2.
|9     |MUXF7    |   598|
2default:defaulth px� 
F
%s*synth2.
|10    |MUXF8    |   150|
2default:defaulth px� 
F
%s*synth2.
|11    |RAMB18E1 |     1|
2default:defaulth px� 
F
%s*synth2.
|12    |FDCE     |    53|
2default:defaulth px� 
F
%s*synth2.
|13    |FDPE     |     3|
2default:defaulth px� 
F
%s*synth2.
|14    |FDRE     |   152|
2default:defaulth px� 
F
%s*synth2.
|15    |LDC      |     1|
2default:defaulth px� 
F
%s*synth2.
|16    |IBUF     |     3|
2default:defaulth px� 
F
%s*synth2.
|17    |OBUF     |    14|
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:29 ; elapsed = 00:01:32 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:17 ; elapsed = 00:01:27 . Memory (MB): peak = 1364.039 ; gain = 133.059
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:29 ; elapsed = 00:01:32 . Memory (MB): peak = 1364.039 ; gain = 286.949
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.2122default:default2
1366.7112default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
7652default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1366.7112default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Z
F  A total of 1 instances were transformed.
  LDC => LDCE: 1 instance 
2default:defaultZ1-111h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1422default:default2
42default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:372default:default2
00:01:422default:default2
1366.7112default:default2
289.6212default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2S
?C:/Users/shoro/Desktop/project_b/project_b.runs/synth_1/TOP.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2p
\Executing : report_utilization -file TOP_utilization_synth.rpt -pb TOP_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue May 30 10:21:12 20232default:defaultZ17-206h px� 


End Record