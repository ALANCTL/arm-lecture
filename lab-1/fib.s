	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}

	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)
	subs r4,r0,#0
	ble .L3

	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)
	cmp r4,#1 @ compare r4 with 1
	ble .L4

	mov r3,#0
	mov r4,#1
	mov r6,r0

ming_loop:
	
	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
	adds r5,r3,r4 
	mov r3,r4
	mov r4,r5

	sub r6,#1

	cmp r6,#1
	bne ming_loop

	mov r0,r5

	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, r6, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, r6, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
