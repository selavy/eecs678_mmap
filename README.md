eecs678_mmap
============

Memory mapping

1. The time required to copy the file using read_write varies with the size
of the buffer specified. Smaller buffer sizes take longer. The time required
for memmap varies much less regardless of how you perform the copy. Discuss
why this is, and in your discussion consider the influence of: (1) the overhead
of the read() and write() system calls and (2) the number of times the data is 
copied under the two methods.

First, with a smaller buffer size, the read() and write() system calls have to
called more times.  These system calls have quite a bit of overhead because
they have to switch to kernel mode and back.  Second, when mmap is used it
allows the operating system to save a lot of physical pages of memory by sharing
the memory mapped regions.  In the read_write program the data has to be copied
to the buffer during the read() call, then re-copied during the write() call.
In the memmap program the data is just copied from the file to the other file,
both are in kernel space.

2. When you use the read_write command as supplied, the size of the copied file
varies with the size of the buffer specified. When you use the memmap command
implemented the size of the source and destination files will watch exactly.
This is because there is a mistake in the read_write code. What is the mistake,
and how can it be corrected?

Currently, read_write will write an integer multiple of bufsz to the new file so
it might (and probably will) write more data than there actually is in the input
file.