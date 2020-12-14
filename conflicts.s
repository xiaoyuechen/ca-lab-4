# an example of iteration where the sum of every word
# in an array is computed

	.data
A: 	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	
C:	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0

B: 	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	
D:	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	

#Total dataset size (from label "start" to end) is 1280 Bytes 

.text
.globl main

main: 
	add $t4, $zero, $zero   # initialize loop invariant to 0
	addi $t5, $zero, 10		# repeat loop 10 times (iteration count) 	
	add $t6, $zero, $zero	# initialize sum

init: 
	la $t0, A			# load start address of array A
	add $t1, $t0, 256	# address of end of array of words
	la $t2, B			# load start address of array A
	add $t3, $t2, 256	# address of end of array of words

loop: 
	lw $t7, 0($t0)			# fetch next element from A
	lw $t8, 0($t2)			# fetch next element from B
	add $t6, $t6, $t7		# sum += A[curr]
	add $t6, $t6, $t8		# sum += B[curr]
	addi $t0, $t0, 4		# point to next address in A
	addi $t2, $t2, 4		# point to next address in B

	bne $t1, $t0, loop	# if not done, start next iteration

	addi $t4, $t4, 1	# increment loop invariant by at the end of every iteration	
	bne $t4, $t5, init	# if iteration count not reached start another iteration
	

	li $v0, 10
	syscall
