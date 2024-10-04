	.text
	.globl	m
	.section	.rodata
	.align 32
	.type	m, @object
	.size	m, 900
m:
	.long	7
	.long	53
	.long	183
	.long	439
	.long	863
	.long	497
	.long	383
	.long	563
	.long	79
	.long	973
	.long	287
	.long	63
	.long	343
	.long	169
	.long	583
	.long	627
	.long	343
	.long	773
	.long	959
	.long	943
	.long	767
	.long	473
	.long	103
	.long	699
	.long	303
	.long	957
	.long	703
	.long	583
	.long	639
	.long	913
	.long	447
	.long	283
	.long	463
	.long	29
	.long	23
	.long	487
	.long	463
	.long	993
	.long	119
	.long	883
	.long	327
	.long	493
	.long	423
	.long	159
	.long	743
	.long	217
	.long	623
	.long	3
	.long	399
	.long	853
	.long	407
	.long	103
	.long	983
	.long	89
	.long	463
	.long	290
	.long	516
	.long	212
	.long	462
	.long	350
	.long	960
	.long	376
	.long	682
	.long	962
	.long	300
	.long	780
	.long	486
	.long	502
	.long	912
	.long	800
	.long	250
	.long	346
	.long	172
	.long	812
	.long	350
	.long	870
	.long	456
	.long	192
	.long	162
	.long	593
	.long	473
	.long	915
	.long	45
	.long	989
	.long	873
	.long	823
	.long	965
	.long	425
	.long	329
	.long	803
	.long	973
	.long	965
	.long	905
	.long	919
	.long	133
	.long	673
	.long	665
	.long	235
	.long	509
	.long	613
	.long	673
	.long	815
	.long	165
	.long	992
	.long	326
	.long	322
	.long	148
	.long	972
	.long	962
	.long	286
	.long	255
	.long	941
	.long	541
	.long	265
	.long	323
	.long	925
	.long	281
	.long	601
	.long	95
	.long	973
	.long	445
	.long	721
	.long	11
	.long	525
	.long	473
	.long	65
	.long	511
	.long	164
	.long	138
	.long	672
	.long	18
	.long	428
	.long	154
	.long	448
	.long	848
	.long	414
	.long	456
	.long	310
	.long	312
	.long	798
	.long	104
	.long	566
	.long	520
	.long	302
	.long	248
	.long	694
	.long	976
	.long	430
	.long	392
	.long	198
	.long	184
	.long	829
	.long	373
	.long	181
	.long	631
	.long	101
	.long	969
	.long	613
	.long	840
	.long	740
	.long	778
	.long	458
	.long	284
	.long	760
	.long	390
	.long	821
	.long	461
	.long	843
	.long	513
	.long	17
	.long	901
	.long	711
	.long	993
	.long	293
	.long	157
	.long	274
	.long	94
	.long	192
	.long	156
	.long	574
	.long	34
	.long	124
	.long	4
	.long	878
	.long	450
	.long	476
	.long	712
	.long	914
	.long	838
	.long	669
	.long	875
	.long	299
	.long	823
	.long	329
	.long	699
	.long	815
	.long	559
	.long	813
	.long	459
	.long	522
	.long	788
	.long	168
	.long	586
	.long	966
	.long	232
	.long	308
	.long	833
	.long	251
	.long	631
	.long	107
	.long	813
	.long	883
	.long	451
	.long	509
	.long	615
	.long	77
	.long	281
	.long	613
	.long	459
	.long	205
	.long	380
	.long	274
	.long	302
	.long	35
	.long	805
	.globl	memo
	.bss
	.align 32
	.type	memo, @object
	.size	memo, 131072
memo:
	.zero	131072
	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	cmpl	$14, -36(%rbp)
	jle	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	memo(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L4
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	memo(%rip), %rax
	movl	(%rdx,%rax), %eax
	jmp	.L3
.L4:
	movl	$-2147483648, -24(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L5
.L9:
	movl	-20(%rbp), %eax
	movl	-40(%rbp), %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rcx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	m(%rip), %rax
	movl	(%rdx,%rax), %ebx
	movl	-20(%rbp), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	andl	-40(%rbp), %eax
	movl	-36(%rbp), %edx
	addl	$1, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	f
	addl	%ebx, %eax
	cmpl	%eax, -24(%rbp)
	jg	.L7
	movl	-20(%rbp), %eax
	movslq	%eax, %rcx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	m(%rip), %rax
	movl	(%rdx,%rax), %ebx
	movl	-20(%rbp), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	andl	-40(%rbp), %eax
	movl	-36(%rbp), %edx
	addl	$1, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	f
	addl	%ebx, %eax
	jmp	.L8
.L7:
	movl	-24(%rbp), %eax
.L8:
	movl	%eax, -24(%rbp)
.L6:
	addl	$1, -20(%rbp)
.L5:
	cmpl	$14, -20(%rbp)
	jle	.L9
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	memo(%rip), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	memo(%rip), %rax
	movl	(%rdx,%rax), %eax
.L3:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	f, .-f
	.section	.rodata
.LC0:
	.string	"Maximal sum: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L11
.L12:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	memo(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L11:
	cmpl	$32767, -4(%rbp)
	jle	.L12
	movl	$32767, %esi
	movl	$0, %edi
	call	f
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
