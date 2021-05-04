
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	f3 0f 1e fb          	endbr32 
       4:	55                   	push   %ebp
       5:	89 e5                	mov    %esp,%ebp
       7:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
       a:	68 50 3d 00 00       	push   $0x3d50
       f:	ff 35 48 5d 00 00    	pushl  0x5d48
      15:	e8 e2 39 00 00       	call   39fc <printf>

  if(mkdir("iputdir") < 0){
      1a:	c7 04 24 e3 3c 00 00 	movl   $0x3ce3,(%esp)
      21:	e8 ed 38 00 00       	call   3913 <mkdir>
      26:	83 c4 10             	add    $0x10,%esp
      29:	85 c0                	test   %eax,%eax
      2b:	78 54                	js     81 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
      2d:	83 ec 0c             	sub    $0xc,%esp
      30:	68 e3 3c 00 00       	push   $0x3ce3
      35:	e8 e1 38 00 00       	call   391b <chdir>
      3a:	83 c4 10             	add    $0x10,%esp
      3d:	85 c0                	test   %eax,%eax
      3f:	78 58                	js     99 <iputtest+0x99>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
      41:	83 ec 0c             	sub    $0xc,%esp
      44:	68 e0 3c 00 00       	push   $0x3ce0
      49:	e8 ad 38 00 00       	call   38fb <unlink>
      4e:	83 c4 10             	add    $0x10,%esp
      51:	85 c0                	test   %eax,%eax
      53:	78 5c                	js     b1 <iputtest+0xb1>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
      55:	83 ec 0c             	sub    $0xc,%esp
      58:	68 05 3d 00 00       	push   $0x3d05
      5d:	e8 b9 38 00 00       	call   391b <chdir>
      62:	83 c4 10             	add    $0x10,%esp
      65:	85 c0                	test   %eax,%eax
      67:	78 60                	js     c9 <iputtest+0xc9>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
      69:	83 ec 08             	sub    $0x8,%esp
      6c:	68 88 3d 00 00       	push   $0x3d88
      71:	ff 35 48 5d 00 00    	pushl  0x5d48
      77:	e8 80 39 00 00       	call   39fc <printf>
}
      7c:	83 c4 10             	add    $0x10,%esp
      7f:	c9                   	leave  
      80:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
      81:	83 ec 08             	sub    $0x8,%esp
      84:	68 bc 3c 00 00       	push   $0x3cbc
      89:	ff 35 48 5d 00 00    	pushl  0x5d48
      8f:	e8 68 39 00 00       	call   39fc <printf>
    exit();
      94:	e8 12 38 00 00       	call   38ab <exit>
    printf(stdout, "chdir iputdir failed\n");
      99:	83 ec 08             	sub    $0x8,%esp
      9c:	68 ca 3c 00 00       	push   $0x3cca
      a1:	ff 35 48 5d 00 00    	pushl  0x5d48
      a7:	e8 50 39 00 00       	call   39fc <printf>
    exit();
      ac:	e8 fa 37 00 00       	call   38ab <exit>
    printf(stdout, "unlink ../iputdir failed\n");
      b1:	83 ec 08             	sub    $0x8,%esp
      b4:	68 eb 3c 00 00       	push   $0x3ceb
      b9:	ff 35 48 5d 00 00    	pushl  0x5d48
      bf:	e8 38 39 00 00       	call   39fc <printf>
    exit();
      c4:	e8 e2 37 00 00       	call   38ab <exit>
    printf(stdout, "chdir / failed\n");
      c9:	83 ec 08             	sub    $0x8,%esp
      cc:	68 07 3d 00 00       	push   $0x3d07
      d1:	ff 35 48 5d 00 00    	pushl  0x5d48
      d7:	e8 20 39 00 00       	call   39fc <printf>
    exit();
      dc:	e8 ca 37 00 00       	call   38ab <exit>

000000e1 <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
      e1:	f3 0f 1e fb          	endbr32 
      e5:	55                   	push   %ebp
      e6:	89 e5                	mov    %esp,%ebp
      e8:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
      eb:	68 17 3d 00 00       	push   $0x3d17
      f0:	ff 35 48 5d 00 00    	pushl  0x5d48
      f6:	e8 01 39 00 00       	call   39fc <printf>

  pid = fork();
      fb:	e8 a3 37 00 00       	call   38a3 <fork>
  if(pid < 0){
     100:	83 c4 10             	add    $0x10,%esp
     103:	85 c0                	test   %eax,%eax
     105:	78 47                	js     14e <exitiputtest+0x6d>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     107:	0f 85 a1 00 00 00    	jne    1ae <exitiputtest+0xcd>
    if(mkdir("iputdir") < 0){
     10d:	83 ec 0c             	sub    $0xc,%esp
     110:	68 e3 3c 00 00       	push   $0x3ce3
     115:	e8 f9 37 00 00       	call   3913 <mkdir>
     11a:	83 c4 10             	add    $0x10,%esp
     11d:	85 c0                	test   %eax,%eax
     11f:	78 45                	js     166 <exitiputtest+0x85>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     121:	83 ec 0c             	sub    $0xc,%esp
     124:	68 e3 3c 00 00       	push   $0x3ce3
     129:	e8 ed 37 00 00       	call   391b <chdir>
     12e:	83 c4 10             	add    $0x10,%esp
     131:	85 c0                	test   %eax,%eax
     133:	78 49                	js     17e <exitiputtest+0x9d>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     135:	83 ec 0c             	sub    $0xc,%esp
     138:	68 e0 3c 00 00       	push   $0x3ce0
     13d:	e8 b9 37 00 00       	call   38fb <unlink>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 4d                	js     196 <exitiputtest+0xb5>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     149:	e8 5d 37 00 00       	call   38ab <exit>
    printf(stdout, "fork failed\n");
     14e:	83 ec 08             	sub    $0x8,%esp
     151:	68 fd 4b 00 00       	push   $0x4bfd
     156:	ff 35 48 5d 00 00    	pushl  0x5d48
     15c:	e8 9b 38 00 00       	call   39fc <printf>
    exit();
     161:	e8 45 37 00 00       	call   38ab <exit>
      printf(stdout, "mkdir failed\n");
     166:	83 ec 08             	sub    $0x8,%esp
     169:	68 bc 3c 00 00       	push   $0x3cbc
     16e:	ff 35 48 5d 00 00    	pushl  0x5d48
     174:	e8 83 38 00 00       	call   39fc <printf>
      exit();
     179:	e8 2d 37 00 00       	call   38ab <exit>
      printf(stdout, "child chdir failed\n");
     17e:	83 ec 08             	sub    $0x8,%esp
     181:	68 26 3d 00 00       	push   $0x3d26
     186:	ff 35 48 5d 00 00    	pushl  0x5d48
     18c:	e8 6b 38 00 00       	call   39fc <printf>
      exit();
     191:	e8 15 37 00 00       	call   38ab <exit>
      printf(stdout, "unlink ../iputdir failed\n");
     196:	83 ec 08             	sub    $0x8,%esp
     199:	68 eb 3c 00 00       	push   $0x3ceb
     19e:	ff 35 48 5d 00 00    	pushl  0x5d48
     1a4:	e8 53 38 00 00       	call   39fc <printf>
      exit();
     1a9:	e8 fd 36 00 00       	call   38ab <exit>
  }
  wait();
     1ae:	e8 00 37 00 00       	call   38b3 <wait>
  printf(stdout, "exitiput test ok\n");
     1b3:	83 ec 08             	sub    $0x8,%esp
     1b6:	68 3a 3d 00 00       	push   $0x3d3a
     1bb:	ff 35 48 5d 00 00    	pushl  0x5d48
     1c1:	e8 36 38 00 00       	call   39fc <printf>
}
     1c6:	83 c4 10             	add    $0x10,%esp
     1c9:	c9                   	leave  
     1ca:	c3                   	ret    

000001cb <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     1cb:	f3 0f 1e fb          	endbr32 
     1cf:	55                   	push   %ebp
     1d0:	89 e5                	mov    %esp,%ebp
     1d2:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     1d5:	68 4c 3d 00 00       	push   $0x3d4c
     1da:	ff 35 48 5d 00 00    	pushl  0x5d48
     1e0:	e8 17 38 00 00       	call   39fc <printf>
  if(mkdir("oidir") < 0){
     1e5:	c7 04 24 5b 3d 00 00 	movl   $0x3d5b,(%esp)
     1ec:	e8 22 37 00 00       	call   3913 <mkdir>
     1f1:	83 c4 10             	add    $0x10,%esp
     1f4:	85 c0                	test   %eax,%eax
     1f6:	78 39                	js     231 <openiputtest+0x66>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     1f8:	e8 a6 36 00 00       	call   38a3 <fork>
  if(pid < 0){
     1fd:	85 c0                	test   %eax,%eax
     1ff:	78 48                	js     249 <openiputtest+0x7e>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     201:	75 63                	jne    266 <openiputtest+0x9b>
    int fd = open("oidir", O_RDWR);
     203:	83 ec 08             	sub    $0x8,%esp
     206:	6a 02                	push   $0x2
     208:	68 5b 3d 00 00       	push   $0x3d5b
     20d:	e8 d9 36 00 00       	call   38eb <open>
    if(fd >= 0){
     212:	83 c4 10             	add    $0x10,%esp
     215:	85 c0                	test   %eax,%eax
     217:	78 48                	js     261 <openiputtest+0x96>
      printf(stdout, "open directory for write succeeded\n");
     219:	83 ec 08             	sub    $0x8,%esp
     21c:	68 e0 4c 00 00       	push   $0x4ce0
     221:	ff 35 48 5d 00 00    	pushl  0x5d48
     227:	e8 d0 37 00 00       	call   39fc <printf>
      exit();
     22c:	e8 7a 36 00 00       	call   38ab <exit>
    printf(stdout, "mkdir oidir failed\n");
     231:	83 ec 08             	sub    $0x8,%esp
     234:	68 61 3d 00 00       	push   $0x3d61
     239:	ff 35 48 5d 00 00    	pushl  0x5d48
     23f:	e8 b8 37 00 00       	call   39fc <printf>
    exit();
     244:	e8 62 36 00 00       	call   38ab <exit>
    printf(stdout, "fork failed\n");
     249:	83 ec 08             	sub    $0x8,%esp
     24c:	68 fd 4b 00 00       	push   $0x4bfd
     251:	ff 35 48 5d 00 00    	pushl  0x5d48
     257:	e8 a0 37 00 00       	call   39fc <printf>
    exit();
     25c:	e8 4a 36 00 00       	call   38ab <exit>
    }
    exit();
     261:	e8 45 36 00 00       	call   38ab <exit>
  }
  sleep(1);
     266:	83 ec 0c             	sub    $0xc,%esp
     269:	6a 01                	push   $0x1
     26b:	e8 cb 36 00 00       	call   393b <sleep>
  if(unlink("oidir") != 0){
     270:	c7 04 24 5b 3d 00 00 	movl   $0x3d5b,(%esp)
     277:	e8 7f 36 00 00       	call   38fb <unlink>
     27c:	83 c4 10             	add    $0x10,%esp
     27f:	85 c0                	test   %eax,%eax
     281:	75 1d                	jne    2a0 <openiputtest+0xd5>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     283:	e8 2b 36 00 00       	call   38b3 <wait>
  printf(stdout, "openiput test ok\n");
     288:	83 ec 08             	sub    $0x8,%esp
     28b:	68 84 3d 00 00       	push   $0x3d84
     290:	ff 35 48 5d 00 00    	pushl  0x5d48
     296:	e8 61 37 00 00       	call   39fc <printf>
}
     29b:	83 c4 10             	add    $0x10,%esp
     29e:	c9                   	leave  
     29f:	c3                   	ret    
    printf(stdout, "unlink failed\n");
     2a0:	83 ec 08             	sub    $0x8,%esp
     2a3:	68 75 3d 00 00       	push   $0x3d75
     2a8:	ff 35 48 5d 00 00    	pushl  0x5d48
     2ae:	e8 49 37 00 00       	call   39fc <printf>
    exit();
     2b3:	e8 f3 35 00 00       	call   38ab <exit>

000002b8 <opentest>:

// simple file system tests

void
opentest(void)
{
     2b8:	f3 0f 1e fb          	endbr32 
     2bc:	55                   	push   %ebp
     2bd:	89 e5                	mov    %esp,%ebp
     2bf:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     2c2:	68 96 3d 00 00       	push   $0x3d96
     2c7:	ff 35 48 5d 00 00    	pushl  0x5d48
     2cd:	e8 2a 37 00 00       	call   39fc <printf>
  fd = open("echo", 0);
     2d2:	83 c4 08             	add    $0x8,%esp
     2d5:	6a 00                	push   $0x0
     2d7:	68 a1 3d 00 00       	push   $0x3da1
     2dc:	e8 0a 36 00 00       	call   38eb <open>
  if(fd < 0){
     2e1:	83 c4 10             	add    $0x10,%esp
     2e4:	85 c0                	test   %eax,%eax
     2e6:	78 37                	js     31f <opentest+0x67>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     2e8:	83 ec 0c             	sub    $0xc,%esp
     2eb:	50                   	push   %eax
     2ec:	e8 e2 35 00 00       	call   38d3 <close>
  fd = open("doesnotexist", 0);
     2f1:	83 c4 08             	add    $0x8,%esp
     2f4:	6a 00                	push   $0x0
     2f6:	68 b9 3d 00 00       	push   $0x3db9
     2fb:	e8 eb 35 00 00       	call   38eb <open>
  if(fd >= 0){
     300:	83 c4 10             	add    $0x10,%esp
     303:	85 c0                	test   %eax,%eax
     305:	79 30                	jns    337 <opentest+0x7f>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     307:	83 ec 08             	sub    $0x8,%esp
     30a:	68 e4 3d 00 00       	push   $0x3de4
     30f:	ff 35 48 5d 00 00    	pushl  0x5d48
     315:	e8 e2 36 00 00       	call   39fc <printf>
}
     31a:	83 c4 10             	add    $0x10,%esp
     31d:	c9                   	leave  
     31e:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     31f:	83 ec 08             	sub    $0x8,%esp
     322:	68 a6 3d 00 00       	push   $0x3da6
     327:	ff 35 48 5d 00 00    	pushl  0x5d48
     32d:	e8 ca 36 00 00       	call   39fc <printf>
    exit();
     332:	e8 74 35 00 00       	call   38ab <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     337:	83 ec 08             	sub    $0x8,%esp
     33a:	68 c6 3d 00 00       	push   $0x3dc6
     33f:	ff 35 48 5d 00 00    	pushl  0x5d48
     345:	e8 b2 36 00 00       	call   39fc <printf>
    exit();
     34a:	e8 5c 35 00 00       	call   38ab <exit>

0000034f <writetest>:

void
writetest(void)
{
     34f:	f3 0f 1e fb          	endbr32 
     353:	55                   	push   %ebp
     354:	89 e5                	mov    %esp,%ebp
     356:	56                   	push   %esi
     357:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     358:	83 ec 08             	sub    $0x8,%esp
     35b:	68 f2 3d 00 00       	push   $0x3df2
     360:	ff 35 48 5d 00 00    	pushl  0x5d48
     366:	e8 91 36 00 00       	call   39fc <printf>
  fd = open("small", O_CREATE|O_RDWR);
     36b:	83 c4 08             	add    $0x8,%esp
     36e:	68 02 02 00 00       	push   $0x202
     373:	68 03 3e 00 00       	push   $0x3e03
     378:	e8 6e 35 00 00       	call   38eb <open>
  if(fd >= 0){
     37d:	83 c4 10             	add    $0x10,%esp
     380:	85 c0                	test   %eax,%eax
     382:	78 57                	js     3db <writetest+0x8c>
     384:	89 c6                	mov    %eax,%esi
    printf(stdout, "creat small succeeded; ok\n");
     386:	83 ec 08             	sub    $0x8,%esp
     389:	68 09 3e 00 00       	push   $0x3e09
     38e:	ff 35 48 5d 00 00    	pushl  0x5d48
     394:	e8 63 36 00 00       	call   39fc <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     399:	83 c4 10             	add    $0x10,%esp
     39c:	bb 00 00 00 00       	mov    $0x0,%ebx
     3a1:	83 fb 63             	cmp    $0x63,%ebx
     3a4:	7f 7f                	jg     425 <writetest+0xd6>
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     3a6:	83 ec 04             	sub    $0x4,%esp
     3a9:	6a 0a                	push   $0xa
     3ab:	68 40 3e 00 00       	push   $0x3e40
     3b0:	56                   	push   %esi
     3b1:	e8 15 35 00 00       	call   38cb <write>
     3b6:	83 c4 10             	add    $0x10,%esp
     3b9:	83 f8 0a             	cmp    $0xa,%eax
     3bc:	75 35                	jne    3f3 <writetest+0xa4>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     3be:	83 ec 04             	sub    $0x4,%esp
     3c1:	6a 0a                	push   $0xa
     3c3:	68 4b 3e 00 00       	push   $0x3e4b
     3c8:	56                   	push   %esi
     3c9:	e8 fd 34 00 00       	call   38cb <write>
     3ce:	83 c4 10             	add    $0x10,%esp
     3d1:	83 f8 0a             	cmp    $0xa,%eax
     3d4:	75 36                	jne    40c <writetest+0xbd>
  for(i = 0; i < 100; i++){
     3d6:	83 c3 01             	add    $0x1,%ebx
     3d9:	eb c6                	jmp    3a1 <writetest+0x52>
    printf(stdout, "error: creat small failed!\n");
     3db:	83 ec 08             	sub    $0x8,%esp
     3de:	68 24 3e 00 00       	push   $0x3e24
     3e3:	ff 35 48 5d 00 00    	pushl  0x5d48
     3e9:	e8 0e 36 00 00       	call   39fc <printf>
    exit();
     3ee:	e8 b8 34 00 00       	call   38ab <exit>
      printf(stdout, "error: write aa %d new file failed\n", i);
     3f3:	83 ec 04             	sub    $0x4,%esp
     3f6:	53                   	push   %ebx
     3f7:	68 04 4d 00 00       	push   $0x4d04
     3fc:	ff 35 48 5d 00 00    	pushl  0x5d48
     402:	e8 f5 35 00 00       	call   39fc <printf>
      exit();
     407:	e8 9f 34 00 00       	call   38ab <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     40c:	83 ec 04             	sub    $0x4,%esp
     40f:	53                   	push   %ebx
     410:	68 28 4d 00 00       	push   $0x4d28
     415:	ff 35 48 5d 00 00    	pushl  0x5d48
     41b:	e8 dc 35 00 00       	call   39fc <printf>
      exit();
     420:	e8 86 34 00 00       	call   38ab <exit>
    }
  }
  printf(stdout, "writes ok\n");
     425:	83 ec 08             	sub    $0x8,%esp
     428:	68 56 3e 00 00       	push   $0x3e56
     42d:	ff 35 48 5d 00 00    	pushl  0x5d48
     433:	e8 c4 35 00 00       	call   39fc <printf>
  close(fd);
     438:	89 34 24             	mov    %esi,(%esp)
     43b:	e8 93 34 00 00       	call   38d3 <close>
  fd = open("small", O_RDONLY);
     440:	83 c4 08             	add    $0x8,%esp
     443:	6a 00                	push   $0x0
     445:	68 03 3e 00 00       	push   $0x3e03
     44a:	e8 9c 34 00 00       	call   38eb <open>
     44f:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     451:	83 c4 10             	add    $0x10,%esp
     454:	85 c0                	test   %eax,%eax
     456:	78 7b                	js     4d3 <writetest+0x184>
    printf(stdout, "open small succeeded ok\n");
     458:	83 ec 08             	sub    $0x8,%esp
     45b:	68 61 3e 00 00       	push   $0x3e61
     460:	ff 35 48 5d 00 00    	pushl  0x5d48
     466:	e8 91 35 00 00       	call   39fc <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     46b:	83 c4 0c             	add    $0xc,%esp
     46e:	68 d0 07 00 00       	push   $0x7d0
     473:	68 20 85 00 00       	push   $0x8520
     478:	53                   	push   %ebx
     479:	e8 45 34 00 00       	call   38c3 <read>
  if(i == 2000){
     47e:	83 c4 10             	add    $0x10,%esp
     481:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     486:	75 63                	jne    4eb <writetest+0x19c>
    printf(stdout, "read succeeded ok\n");
     488:	83 ec 08             	sub    $0x8,%esp
     48b:	68 95 3e 00 00       	push   $0x3e95
     490:	ff 35 48 5d 00 00    	pushl  0x5d48
     496:	e8 61 35 00 00       	call   39fc <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     49b:	89 1c 24             	mov    %ebx,(%esp)
     49e:	e8 30 34 00 00       	call   38d3 <close>

  if(unlink("small") < 0){
     4a3:	c7 04 24 03 3e 00 00 	movl   $0x3e03,(%esp)
     4aa:	e8 4c 34 00 00       	call   38fb <unlink>
     4af:	83 c4 10             	add    $0x10,%esp
     4b2:	85 c0                	test   %eax,%eax
     4b4:	78 4d                	js     503 <writetest+0x1b4>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     4b6:	83 ec 08             	sub    $0x8,%esp
     4b9:	68 bd 3e 00 00       	push   $0x3ebd
     4be:	ff 35 48 5d 00 00    	pushl  0x5d48
     4c4:	e8 33 35 00 00       	call   39fc <printf>
}
     4c9:	83 c4 10             	add    $0x10,%esp
     4cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4cf:	5b                   	pop    %ebx
     4d0:	5e                   	pop    %esi
     4d1:	5d                   	pop    %ebp
     4d2:	c3                   	ret    
    printf(stdout, "error: open small failed!\n");
     4d3:	83 ec 08             	sub    $0x8,%esp
     4d6:	68 7a 3e 00 00       	push   $0x3e7a
     4db:	ff 35 48 5d 00 00    	pushl  0x5d48
     4e1:	e8 16 35 00 00       	call   39fc <printf>
    exit();
     4e6:	e8 c0 33 00 00       	call   38ab <exit>
    printf(stdout, "read failed\n");
     4eb:	83 ec 08             	sub    $0x8,%esp
     4ee:	68 c1 41 00 00       	push   $0x41c1
     4f3:	ff 35 48 5d 00 00    	pushl  0x5d48
     4f9:	e8 fe 34 00 00       	call   39fc <printf>
    exit();
     4fe:	e8 a8 33 00 00       	call   38ab <exit>
    printf(stdout, "unlink small failed\n");
     503:	83 ec 08             	sub    $0x8,%esp
     506:	68 a8 3e 00 00       	push   $0x3ea8
     50b:	ff 35 48 5d 00 00    	pushl  0x5d48
     511:	e8 e6 34 00 00       	call   39fc <printf>
    exit();
     516:	e8 90 33 00 00       	call   38ab <exit>

0000051b <writetest1>:

void
writetest1(void)
{
     51b:	f3 0f 1e fb          	endbr32 
     51f:	55                   	push   %ebp
     520:	89 e5                	mov    %esp,%ebp
     522:	56                   	push   %esi
     523:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     524:	83 ec 08             	sub    $0x8,%esp
     527:	68 d1 3e 00 00       	push   $0x3ed1
     52c:	ff 35 48 5d 00 00    	pushl  0x5d48
     532:	e8 c5 34 00 00       	call   39fc <printf>

  fd = open("big", O_CREATE|O_RDWR);
     537:	83 c4 08             	add    $0x8,%esp
     53a:	68 02 02 00 00       	push   $0x202
     53f:	68 4b 3f 00 00       	push   $0x3f4b
     544:	e8 a2 33 00 00       	call   38eb <open>
  if(fd < 0){
     549:	83 c4 10             	add    $0x10,%esp
     54c:	85 c0                	test   %eax,%eax
     54e:	78 37                	js     587 <writetest1+0x6c>
     550:	89 c6                	mov    %eax,%esi
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     552:	bb 00 00 00 00       	mov    $0x0,%ebx
     557:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     55d:	77 59                	ja     5b8 <writetest1+0x9d>
    ((int*)buf)[0] = i;
     55f:	89 1d 20 85 00 00    	mov    %ebx,0x8520
    if(write(fd, buf, 512) != 512){
     565:	83 ec 04             	sub    $0x4,%esp
     568:	68 00 02 00 00       	push   $0x200
     56d:	68 20 85 00 00       	push   $0x8520
     572:	56                   	push   %esi
     573:	e8 53 33 00 00       	call   38cb <write>
     578:	83 c4 10             	add    $0x10,%esp
     57b:	3d 00 02 00 00       	cmp    $0x200,%eax
     580:	75 1d                	jne    59f <writetest1+0x84>
  for(i = 0; i < MAXFILE; i++){
     582:	83 c3 01             	add    $0x1,%ebx
     585:	eb d0                	jmp    557 <writetest1+0x3c>
    printf(stdout, "error: creat big failed!\n");
     587:	83 ec 08             	sub    $0x8,%esp
     58a:	68 e1 3e 00 00       	push   $0x3ee1
     58f:	ff 35 48 5d 00 00    	pushl  0x5d48
     595:	e8 62 34 00 00       	call   39fc <printf>
    exit();
     59a:	e8 0c 33 00 00       	call   38ab <exit>
      printf(stdout, "error: write big file failed\n", i);
     59f:	83 ec 04             	sub    $0x4,%esp
     5a2:	53                   	push   %ebx
     5a3:	68 fb 3e 00 00       	push   $0x3efb
     5a8:	ff 35 48 5d 00 00    	pushl  0x5d48
     5ae:	e8 49 34 00 00       	call   39fc <printf>
      exit();
     5b3:	e8 f3 32 00 00       	call   38ab <exit>
    }
  }

  close(fd);
     5b8:	83 ec 0c             	sub    $0xc,%esp
     5bb:	56                   	push   %esi
     5bc:	e8 12 33 00 00       	call   38d3 <close>

  fd = open("big", O_RDONLY);
     5c1:	83 c4 08             	add    $0x8,%esp
     5c4:	6a 00                	push   $0x0
     5c6:	68 4b 3f 00 00       	push   $0x3f4b
     5cb:	e8 1b 33 00 00       	call   38eb <open>
     5d0:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     5d2:	83 c4 10             	add    $0x10,%esp
     5d5:	85 c0                	test   %eax,%eax
     5d7:	78 3c                	js     615 <writetest1+0xfa>
    printf(stdout, "error: open big failed!\n");
    exit();
  }

  n = 0;
     5d9:	bb 00 00 00 00       	mov    $0x0,%ebx
  for(;;){
    i = read(fd, buf, 512);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	68 00 02 00 00       	push   $0x200
     5e6:	68 20 85 00 00       	push   $0x8520
     5eb:	56                   	push   %esi
     5ec:	e8 d2 32 00 00       	call   38c3 <read>
    if(i == 0){
     5f1:	83 c4 10             	add    $0x10,%esp
     5f4:	85 c0                	test   %eax,%eax
     5f6:	74 35                	je     62d <writetest1+0x112>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     5f8:	3d 00 02 00 00       	cmp    $0x200,%eax
     5fd:	0f 85 84 00 00 00    	jne    687 <writetest1+0x16c>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     603:	a1 20 85 00 00       	mov    0x8520,%eax
     608:	39 d8                	cmp    %ebx,%eax
     60a:	0f 85 90 00 00 00    	jne    6a0 <writetest1+0x185>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     610:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     613:	eb c9                	jmp    5de <writetest1+0xc3>
    printf(stdout, "error: open big failed!\n");
     615:	83 ec 08             	sub    $0x8,%esp
     618:	68 19 3f 00 00       	push   $0x3f19
     61d:	ff 35 48 5d 00 00    	pushl  0x5d48
     623:	e8 d4 33 00 00       	call   39fc <printf>
    exit();
     628:	e8 7e 32 00 00       	call   38ab <exit>
      if(n == MAXFILE - 1){
     62d:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     633:	74 39                	je     66e <writetest1+0x153>
  }
  close(fd);
     635:	83 ec 0c             	sub    $0xc,%esp
     638:	56                   	push   %esi
     639:	e8 95 32 00 00       	call   38d3 <close>
  if(unlink("big") < 0){
     63e:	c7 04 24 4b 3f 00 00 	movl   $0x3f4b,(%esp)
     645:	e8 b1 32 00 00       	call   38fb <unlink>
     64a:	83 c4 10             	add    $0x10,%esp
     64d:	85 c0                	test   %eax,%eax
     64f:	78 66                	js     6b7 <writetest1+0x19c>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     651:	83 ec 08             	sub    $0x8,%esp
     654:	68 72 3f 00 00       	push   $0x3f72
     659:	ff 35 48 5d 00 00    	pushl  0x5d48
     65f:	e8 98 33 00 00       	call   39fc <printf>
}
     664:	83 c4 10             	add    $0x10,%esp
     667:	8d 65 f8             	lea    -0x8(%ebp),%esp
     66a:	5b                   	pop    %ebx
     66b:	5e                   	pop    %esi
     66c:	5d                   	pop    %ebp
     66d:	c3                   	ret    
        printf(stdout, "read only %d blocks from big", n);
     66e:	83 ec 04             	sub    $0x4,%esp
     671:	53                   	push   %ebx
     672:	68 32 3f 00 00       	push   $0x3f32
     677:	ff 35 48 5d 00 00    	pushl  0x5d48
     67d:	e8 7a 33 00 00       	call   39fc <printf>
        exit();
     682:	e8 24 32 00 00       	call   38ab <exit>
      printf(stdout, "read failed %d\n", i);
     687:	83 ec 04             	sub    $0x4,%esp
     68a:	50                   	push   %eax
     68b:	68 4f 3f 00 00       	push   $0x3f4f
     690:	ff 35 48 5d 00 00    	pushl  0x5d48
     696:	e8 61 33 00 00       	call   39fc <printf>
      exit();
     69b:	e8 0b 32 00 00       	call   38ab <exit>
      printf(stdout, "read content of block %d is %d\n",
     6a0:	50                   	push   %eax
     6a1:	53                   	push   %ebx
     6a2:	68 4c 4d 00 00       	push   $0x4d4c
     6a7:	ff 35 48 5d 00 00    	pushl  0x5d48
     6ad:	e8 4a 33 00 00       	call   39fc <printf>
      exit();
     6b2:	e8 f4 31 00 00       	call   38ab <exit>
    printf(stdout, "unlink big failed\n");
     6b7:	83 ec 08             	sub    $0x8,%esp
     6ba:	68 5f 3f 00 00       	push   $0x3f5f
     6bf:	ff 35 48 5d 00 00    	pushl  0x5d48
     6c5:	e8 32 33 00 00       	call   39fc <printf>
    exit();
     6ca:	e8 dc 31 00 00       	call   38ab <exit>

000006cf <createtest>:

void
createtest(void)
{
     6cf:	f3 0f 1e fb          	endbr32 
     6d3:	55                   	push   %ebp
     6d4:	89 e5                	mov    %esp,%ebp
     6d6:	53                   	push   %ebx
     6d7:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     6da:	68 6c 4d 00 00       	push   $0x4d6c
     6df:	ff 35 48 5d 00 00    	pushl  0x5d48
     6e5:	e8 12 33 00 00       	call   39fc <printf>

  name[0] = 'a';
     6ea:	c6 05 20 a5 00 00 61 	movb   $0x61,0xa520
  name[2] = '\0';
     6f1:	c6 05 22 a5 00 00 00 	movb   $0x0,0xa522
  for(i = 0; i < 52; i++){
     6f8:	83 c4 10             	add    $0x10,%esp
     6fb:	bb 00 00 00 00       	mov    $0x0,%ebx
     700:	eb 28                	jmp    72a <createtest+0x5b>
    name[1] = '0' + i;
     702:	8d 43 30             	lea    0x30(%ebx),%eax
     705:	a2 21 a5 00 00       	mov    %al,0xa521
    fd = open(name, O_CREATE|O_RDWR);
     70a:	83 ec 08             	sub    $0x8,%esp
     70d:	68 02 02 00 00       	push   $0x202
     712:	68 20 a5 00 00       	push   $0xa520
     717:	e8 cf 31 00 00       	call   38eb <open>
    close(fd);
     71c:	89 04 24             	mov    %eax,(%esp)
     71f:	e8 af 31 00 00       	call   38d3 <close>
  for(i = 0; i < 52; i++){
     724:	83 c3 01             	add    $0x1,%ebx
     727:	83 c4 10             	add    $0x10,%esp
     72a:	83 fb 33             	cmp    $0x33,%ebx
     72d:	7e d3                	jle    702 <createtest+0x33>
  }
  name[0] = 'a';
     72f:	c6 05 20 a5 00 00 61 	movb   $0x61,0xa520
  name[2] = '\0';
     736:	c6 05 22 a5 00 00 00 	movb   $0x0,0xa522
  for(i = 0; i < 52; i++){
     73d:	bb 00 00 00 00       	mov    $0x0,%ebx
     742:	eb 1b                	jmp    75f <createtest+0x90>
    name[1] = '0' + i;
     744:	8d 43 30             	lea    0x30(%ebx),%eax
     747:	a2 21 a5 00 00       	mov    %al,0xa521
    unlink(name);
     74c:	83 ec 0c             	sub    $0xc,%esp
     74f:	68 20 a5 00 00       	push   $0xa520
     754:	e8 a2 31 00 00       	call   38fb <unlink>
  for(i = 0; i < 52; i++){
     759:	83 c3 01             	add    $0x1,%ebx
     75c:	83 c4 10             	add    $0x10,%esp
     75f:	83 fb 33             	cmp    $0x33,%ebx
     762:	7e e0                	jle    744 <createtest+0x75>
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     764:	83 ec 08             	sub    $0x8,%esp
     767:	68 94 4d 00 00       	push   $0x4d94
     76c:	ff 35 48 5d 00 00    	pushl  0x5d48
     772:	e8 85 32 00 00       	call   39fc <printf>
}
     777:	83 c4 10             	add    $0x10,%esp
     77a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     77d:	c9                   	leave  
     77e:	c3                   	ret    

0000077f <dirtest>:

void dirtest(void)
{
     77f:	f3 0f 1e fb          	endbr32 
     783:	55                   	push   %ebp
     784:	89 e5                	mov    %esp,%ebp
     786:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     789:	68 80 3f 00 00       	push   $0x3f80
     78e:	ff 35 48 5d 00 00    	pushl  0x5d48
     794:	e8 63 32 00 00       	call   39fc <printf>

  if(mkdir("dir0") < 0){
     799:	c7 04 24 8c 3f 00 00 	movl   $0x3f8c,(%esp)
     7a0:	e8 6e 31 00 00       	call   3913 <mkdir>
     7a5:	83 c4 10             	add    $0x10,%esp
     7a8:	85 c0                	test   %eax,%eax
     7aa:	78 54                	js     800 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     7ac:	83 ec 0c             	sub    $0xc,%esp
     7af:	68 8c 3f 00 00       	push   $0x3f8c
     7b4:	e8 62 31 00 00       	call   391b <chdir>
     7b9:	83 c4 10             	add    $0x10,%esp
     7bc:	85 c0                	test   %eax,%eax
     7be:	78 58                	js     818 <dirtest+0x99>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     7c0:	83 ec 0c             	sub    $0xc,%esp
     7c3:	68 31 45 00 00       	push   $0x4531
     7c8:	e8 4e 31 00 00       	call   391b <chdir>
     7cd:	83 c4 10             	add    $0x10,%esp
     7d0:	85 c0                	test   %eax,%eax
     7d2:	78 5c                	js     830 <dirtest+0xb1>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     7d4:	83 ec 0c             	sub    $0xc,%esp
     7d7:	68 8c 3f 00 00       	push   $0x3f8c
     7dc:	e8 1a 31 00 00       	call   38fb <unlink>
     7e1:	83 c4 10             	add    $0x10,%esp
     7e4:	85 c0                	test   %eax,%eax
     7e6:	78 60                	js     848 <dirtest+0xc9>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     7e8:	83 ec 08             	sub    $0x8,%esp
     7eb:	68 c9 3f 00 00       	push   $0x3fc9
     7f0:	ff 35 48 5d 00 00    	pushl  0x5d48
     7f6:	e8 01 32 00 00       	call   39fc <printf>
}
     7fb:	83 c4 10             	add    $0x10,%esp
     7fe:	c9                   	leave  
     7ff:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     800:	83 ec 08             	sub    $0x8,%esp
     803:	68 bc 3c 00 00       	push   $0x3cbc
     808:	ff 35 48 5d 00 00    	pushl  0x5d48
     80e:	e8 e9 31 00 00       	call   39fc <printf>
    exit();
     813:	e8 93 30 00 00       	call   38ab <exit>
    printf(stdout, "chdir dir0 failed\n");
     818:	83 ec 08             	sub    $0x8,%esp
     81b:	68 91 3f 00 00       	push   $0x3f91
     820:	ff 35 48 5d 00 00    	pushl  0x5d48
     826:	e8 d1 31 00 00       	call   39fc <printf>
    exit();
     82b:	e8 7b 30 00 00       	call   38ab <exit>
    printf(stdout, "chdir .. failed\n");
     830:	83 ec 08             	sub    $0x8,%esp
     833:	68 a4 3f 00 00       	push   $0x3fa4
     838:	ff 35 48 5d 00 00    	pushl  0x5d48
     83e:	e8 b9 31 00 00       	call   39fc <printf>
    exit();
     843:	e8 63 30 00 00       	call   38ab <exit>
    printf(stdout, "unlink dir0 failed\n");
     848:	83 ec 08             	sub    $0x8,%esp
     84b:	68 b5 3f 00 00       	push   $0x3fb5
     850:	ff 35 48 5d 00 00    	pushl  0x5d48
     856:	e8 a1 31 00 00       	call   39fc <printf>
    exit();
     85b:	e8 4b 30 00 00       	call   38ab <exit>

00000860 <exectest>:

void
exectest(void)
{
     860:	f3 0f 1e fb          	endbr32 
     864:	55                   	push   %ebp
     865:	89 e5                	mov    %esp,%ebp
     867:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     86a:	68 d8 3f 00 00       	push   $0x3fd8
     86f:	ff 35 48 5d 00 00    	pushl  0x5d48
     875:	e8 82 31 00 00       	call   39fc <printf>
  if(exec("echo", echoargv) < 0){
     87a:	83 c4 08             	add    $0x8,%esp
     87d:	68 4c 5d 00 00       	push   $0x5d4c
     882:	68 a1 3d 00 00       	push   $0x3da1
     887:	e8 57 30 00 00       	call   38e3 <exec>
     88c:	83 c4 10             	add    $0x10,%esp
     88f:	85 c0                	test   %eax,%eax
     891:	78 02                	js     895 <exectest+0x35>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     893:	c9                   	leave  
     894:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     895:	83 ec 08             	sub    $0x8,%esp
     898:	68 e3 3f 00 00       	push   $0x3fe3
     89d:	ff 35 48 5d 00 00    	pushl  0x5d48
     8a3:	e8 54 31 00 00       	call   39fc <printf>
    exit();
     8a8:	e8 fe 2f 00 00       	call   38ab <exit>

000008ad <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     8ad:	f3 0f 1e fb          	endbr32 
     8b1:	55                   	push   %ebp
     8b2:	89 e5                	mov    %esp,%ebp
     8b4:	57                   	push   %edi
     8b5:	56                   	push   %esi
     8b6:	53                   	push   %ebx
     8b7:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     8ba:	8d 45 e0             	lea    -0x20(%ebp),%eax
     8bd:	50                   	push   %eax
     8be:	e8 f8 2f 00 00       	call   38bb <pipe>
     8c3:	83 c4 10             	add    $0x10,%esp
     8c6:	85 c0                	test   %eax,%eax
     8c8:	75 74                	jne    93e <pipe1+0x91>
     8ca:	89 c6                	mov    %eax,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     8cc:	e8 d2 2f 00 00       	call   38a3 <fork>
     8d1:	89 c7                	mov    %eax,%edi
  seq = 0;
  if(pid == 0){
     8d3:	85 c0                	test   %eax,%eax
     8d5:	74 7b                	je     952 <pipe1+0xa5>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     8d7:	0f 8e 60 01 00 00    	jle    a3d <pipe1+0x190>
    close(fds[1]);
     8dd:	83 ec 0c             	sub    $0xc,%esp
     8e0:	ff 75 e4             	pushl  -0x1c(%ebp)
     8e3:	e8 eb 2f 00 00       	call   38d3 <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     8e8:	83 c4 10             	add    $0x10,%esp
    total = 0;
     8eb:	89 75 d0             	mov    %esi,-0x30(%ebp)
  seq = 0;
     8ee:	89 f3                	mov    %esi,%ebx
    cc = 1;
     8f0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     8f7:	83 ec 04             	sub    $0x4,%esp
     8fa:	ff 75 d4             	pushl  -0x2c(%ebp)
     8fd:	68 20 85 00 00       	push   $0x8520
     902:	ff 75 e0             	pushl  -0x20(%ebp)
     905:	e8 b9 2f 00 00       	call   38c3 <read>
     90a:	89 c7                	mov    %eax,%edi
     90c:	83 c4 10             	add    $0x10,%esp
     90f:	85 c0                	test   %eax,%eax
     911:	0f 8e e2 00 00 00    	jle    9f9 <pipe1+0x14c>
      for(i = 0; i < n; i++){
     917:	89 f0                	mov    %esi,%eax
     919:	89 d9                	mov    %ebx,%ecx
     91b:	39 f8                	cmp    %edi,%eax
     91d:	0f 8d b4 00 00 00    	jge    9d7 <pipe1+0x12a>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     923:	0f be 98 20 85 00 00 	movsbl 0x8520(%eax),%ebx
     92a:	8d 51 01             	lea    0x1(%ecx),%edx
     92d:	31 cb                	xor    %ecx,%ebx
     92f:	84 db                	test   %bl,%bl
     931:	0f 85 86 00 00 00    	jne    9bd <pipe1+0x110>
      for(i = 0; i < n; i++){
     937:	83 c0 01             	add    $0x1,%eax
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     93a:	89 d1                	mov    %edx,%ecx
     93c:	eb dd                	jmp    91b <pipe1+0x6e>
    printf(1, "pipe() failed\n");
     93e:	83 ec 08             	sub    $0x8,%esp
     941:	68 f5 3f 00 00       	push   $0x3ff5
     946:	6a 01                	push   $0x1
     948:	e8 af 30 00 00       	call   39fc <printf>
    exit();
     94d:	e8 59 2f 00 00       	call   38ab <exit>
    close(fds[0]);
     952:	83 ec 0c             	sub    $0xc,%esp
     955:	ff 75 e0             	pushl  -0x20(%ebp)
     958:	e8 76 2f 00 00       	call   38d3 <close>
    for(n = 0; n < 5; n++){
     95d:	83 c4 10             	add    $0x10,%esp
     960:	89 fe                	mov    %edi,%esi
  seq = 0;
     962:	89 fb                	mov    %edi,%ebx
    for(n = 0; n < 5; n++){
     964:	eb 22                	jmp    988 <pipe1+0xdb>
      if(write(fds[1], buf, 1033) != 1033){
     966:	83 ec 04             	sub    $0x4,%esp
     969:	68 09 04 00 00       	push   $0x409
     96e:	68 20 85 00 00       	push   $0x8520
     973:	ff 75 e4             	pushl  -0x1c(%ebp)
     976:	e8 50 2f 00 00       	call   38cb <write>
     97b:	83 c4 10             	add    $0x10,%esp
     97e:	3d 09 04 00 00       	cmp    $0x409,%eax
     983:	75 1f                	jne    9a4 <pipe1+0xf7>
    for(n = 0; n < 5; n++){
     985:	83 c6 01             	add    $0x1,%esi
     988:	83 fe 04             	cmp    $0x4,%esi
     98b:	7f 2b                	jg     9b8 <pipe1+0x10b>
      for(i = 0; i < 1033; i++)
     98d:	89 f8                	mov    %edi,%eax
     98f:	3d 08 04 00 00       	cmp    $0x408,%eax
     994:	7f d0                	jg     966 <pipe1+0xb9>
        buf[i] = seq++;
     996:	88 98 20 85 00 00    	mov    %bl,0x8520(%eax)
      for(i = 0; i < 1033; i++)
     99c:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     99f:	8d 5b 01             	lea    0x1(%ebx),%ebx
     9a2:	eb eb                	jmp    98f <pipe1+0xe2>
        printf(1, "pipe1 oops 1\n");
     9a4:	83 ec 08             	sub    $0x8,%esp
     9a7:	68 04 40 00 00       	push   $0x4004
     9ac:	6a 01                	push   $0x1
     9ae:	e8 49 30 00 00       	call   39fc <printf>
        exit();
     9b3:	e8 f3 2e 00 00       	call   38ab <exit>
    exit();
     9b8:	e8 ee 2e 00 00       	call   38ab <exit>
          printf(1, "pipe1 oops 2\n");
     9bd:	83 ec 08             	sub    $0x8,%esp
     9c0:	68 12 40 00 00       	push   $0x4012
     9c5:	6a 01                	push   $0x1
     9c7:	e8 30 30 00 00       	call   39fc <printf>
          return;
     9cc:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     9cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9d2:	5b                   	pop    %ebx
     9d3:	5e                   	pop    %esi
     9d4:	5f                   	pop    %edi
     9d5:	5d                   	pop    %ebp
     9d6:	c3                   	ret    
     9d7:	89 cb                	mov    %ecx,%ebx
      total += n;
     9d9:	01 7d d0             	add    %edi,-0x30(%ebp)
      cc = cc * 2;
     9dc:	d1 65 d4             	shll   -0x2c(%ebp)
     9df:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      if(cc > sizeof(buf))
     9e2:	3d 00 20 00 00       	cmp    $0x2000,%eax
     9e7:	0f 86 0a ff ff ff    	jbe    8f7 <pipe1+0x4a>
        cc = sizeof(buf);
     9ed:	c7 45 d4 00 20 00 00 	movl   $0x2000,-0x2c(%ebp)
     9f4:	e9 fe fe ff ff       	jmp    8f7 <pipe1+0x4a>
    if(total != 5 * 1033){
     9f9:	81 7d d0 2d 14 00 00 	cmpl   $0x142d,-0x30(%ebp)
     a00:	75 24                	jne    a26 <pipe1+0x179>
    close(fds[0]);
     a02:	83 ec 0c             	sub    $0xc,%esp
     a05:	ff 75 e0             	pushl  -0x20(%ebp)
     a08:	e8 c6 2e 00 00       	call   38d3 <close>
    wait();
     a0d:	e8 a1 2e 00 00       	call   38b3 <wait>
  printf(1, "pipe1 ok\n");
     a12:	83 c4 08             	add    $0x8,%esp
     a15:	68 37 40 00 00       	push   $0x4037
     a1a:	6a 01                	push   $0x1
     a1c:	e8 db 2f 00 00       	call   39fc <printf>
     a21:	83 c4 10             	add    $0x10,%esp
     a24:	eb a9                	jmp    9cf <pipe1+0x122>
      printf(1, "pipe1 oops 3 total %d\n", total);
     a26:	83 ec 04             	sub    $0x4,%esp
     a29:	ff 75 d0             	pushl  -0x30(%ebp)
     a2c:	68 20 40 00 00       	push   $0x4020
     a31:	6a 01                	push   $0x1
     a33:	e8 c4 2f 00 00       	call   39fc <printf>
      exit();
     a38:	e8 6e 2e 00 00       	call   38ab <exit>
    printf(1, "fork() failed\n");
     a3d:	83 ec 08             	sub    $0x8,%esp
     a40:	68 41 40 00 00       	push   $0x4041
     a45:	6a 01                	push   $0x1
     a47:	e8 b0 2f 00 00       	call   39fc <printf>
    exit();
     a4c:	e8 5a 2e 00 00       	call   38ab <exit>

00000a51 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     a51:	f3 0f 1e fb          	endbr32 
     a55:	55                   	push   %ebp
     a56:	89 e5                	mov    %esp,%ebp
     a58:	57                   	push   %edi
     a59:	56                   	push   %esi
     a5a:	53                   	push   %ebx
     a5b:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     a5e:	68 50 40 00 00       	push   $0x4050
     a63:	6a 01                	push   $0x1
     a65:	e8 92 2f 00 00       	call   39fc <printf>
  pid1 = fork();
     a6a:	e8 34 2e 00 00       	call   38a3 <fork>
  if(pid1 == 0)
     a6f:	83 c4 10             	add    $0x10,%esp
     a72:	85 c0                	test   %eax,%eax
     a74:	75 02                	jne    a78 <preempt+0x27>
    for(;;)
     a76:	eb fe                	jmp    a76 <preempt+0x25>
     a78:	89 c7                	mov    %eax,%edi
      ;

  pid2 = fork();
     a7a:	e8 24 2e 00 00       	call   38a3 <fork>
     a7f:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     a81:	85 c0                	test   %eax,%eax
     a83:	75 02                	jne    a87 <preempt+0x36>
    for(;;)
     a85:	eb fe                	jmp    a85 <preempt+0x34>
      ;

  pipe(pfds);
     a87:	83 ec 0c             	sub    $0xc,%esp
     a8a:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a8d:	50                   	push   %eax
     a8e:	e8 28 2e 00 00       	call   38bb <pipe>
  pid3 = fork();
     a93:	e8 0b 2e 00 00       	call   38a3 <fork>
     a98:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     a9a:	83 c4 10             	add    $0x10,%esp
     a9d:	85 c0                	test   %eax,%eax
     a9f:	75 49                	jne    aea <preempt+0x99>
    close(pfds[0]);
     aa1:	83 ec 0c             	sub    $0xc,%esp
     aa4:	ff 75 e0             	pushl  -0x20(%ebp)
     aa7:	e8 27 2e 00 00       	call   38d3 <close>
    if(write(pfds[1], "x", 1) != 1)
     aac:	83 c4 0c             	add    $0xc,%esp
     aaf:	6a 01                	push   $0x1
     ab1:	68 15 46 00 00       	push   $0x4615
     ab6:	ff 75 e4             	pushl  -0x1c(%ebp)
     ab9:	e8 0d 2e 00 00       	call   38cb <write>
     abe:	83 c4 10             	add    $0x10,%esp
     ac1:	83 f8 01             	cmp    $0x1,%eax
     ac4:	75 10                	jne    ad6 <preempt+0x85>
      printf(1, "preempt write error");
    close(pfds[1]);
     ac6:	83 ec 0c             	sub    $0xc,%esp
     ac9:	ff 75 e4             	pushl  -0x1c(%ebp)
     acc:	e8 02 2e 00 00       	call   38d3 <close>
     ad1:	83 c4 10             	add    $0x10,%esp
    for(;;)
     ad4:	eb fe                	jmp    ad4 <preempt+0x83>
      printf(1, "preempt write error");
     ad6:	83 ec 08             	sub    $0x8,%esp
     ad9:	68 5a 40 00 00       	push   $0x405a
     ade:	6a 01                	push   $0x1
     ae0:	e8 17 2f 00 00       	call   39fc <printf>
     ae5:	83 c4 10             	add    $0x10,%esp
     ae8:	eb dc                	jmp    ac6 <preempt+0x75>
      ;
  }

  close(pfds[1]);
     aea:	83 ec 0c             	sub    $0xc,%esp
     aed:	ff 75 e4             	pushl  -0x1c(%ebp)
     af0:	e8 de 2d 00 00       	call   38d3 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     af5:	83 c4 0c             	add    $0xc,%esp
     af8:	68 00 20 00 00       	push   $0x2000
     afd:	68 20 85 00 00       	push   $0x8520
     b02:	ff 75 e0             	pushl  -0x20(%ebp)
     b05:	e8 b9 2d 00 00       	call   38c3 <read>
     b0a:	83 c4 10             	add    $0x10,%esp
     b0d:	83 f8 01             	cmp    $0x1,%eax
     b10:	74 1a                	je     b2c <preempt+0xdb>
    printf(1, "preempt read error");
     b12:	83 ec 08             	sub    $0x8,%esp
     b15:	68 6e 40 00 00       	push   $0x406e
     b1a:	6a 01                	push   $0x1
     b1c:	e8 db 2e 00 00       	call   39fc <printf>
    return;
     b21:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     b24:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b27:	5b                   	pop    %ebx
     b28:	5e                   	pop    %esi
     b29:	5f                   	pop    %edi
     b2a:	5d                   	pop    %ebp
     b2b:	c3                   	ret    
  close(pfds[0]);
     b2c:	83 ec 0c             	sub    $0xc,%esp
     b2f:	ff 75 e0             	pushl  -0x20(%ebp)
     b32:	e8 9c 2d 00 00       	call   38d3 <close>
  printf(1, "kill... ");
     b37:	83 c4 08             	add    $0x8,%esp
     b3a:	68 81 40 00 00       	push   $0x4081
     b3f:	6a 01                	push   $0x1
     b41:	e8 b6 2e 00 00       	call   39fc <printf>
  kill(pid1);
     b46:	89 3c 24             	mov    %edi,(%esp)
     b49:	e8 8d 2d 00 00       	call   38db <kill>
  kill(pid2);
     b4e:	89 34 24             	mov    %esi,(%esp)
     b51:	e8 85 2d 00 00       	call   38db <kill>
  kill(pid3);
     b56:	89 1c 24             	mov    %ebx,(%esp)
     b59:	e8 7d 2d 00 00       	call   38db <kill>
  printf(1, "wait... ");
     b5e:	83 c4 08             	add    $0x8,%esp
     b61:	68 8a 40 00 00       	push   $0x408a
     b66:	6a 01                	push   $0x1
     b68:	e8 8f 2e 00 00       	call   39fc <printf>
  wait();
     b6d:	e8 41 2d 00 00       	call   38b3 <wait>
  wait();
     b72:	e8 3c 2d 00 00       	call   38b3 <wait>
  wait();
     b77:	e8 37 2d 00 00       	call   38b3 <wait>
  printf(1, "preempt ok\n");
     b7c:	83 c4 08             	add    $0x8,%esp
     b7f:	68 93 40 00 00       	push   $0x4093
     b84:	6a 01                	push   $0x1
     b86:	e8 71 2e 00 00       	call   39fc <printf>
     b8b:	83 c4 10             	add    $0x10,%esp
     b8e:	eb 94                	jmp    b24 <preempt+0xd3>

00000b90 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     b90:	f3 0f 1e fb          	endbr32 
     b94:	55                   	push   %ebp
     b95:	89 e5                	mov    %esp,%ebp
     b97:	56                   	push   %esi
     b98:	53                   	push   %ebx
  int i, pid;

  for(i = 0; i < 100; i++){
     b99:	be 00 00 00 00       	mov    $0x0,%esi
     b9e:	eb 21                	jmp    bc1 <exitwait+0x31>
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
     ba0:	83 ec 08             	sub    $0x8,%esp
     ba3:	68 fd 4b 00 00       	push   $0x4bfd
     ba8:	6a 01                	push   $0x1
     baa:	e8 4d 2e 00 00       	call   39fc <printf>
      return;
     baf:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     bb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
     bb5:	5b                   	pop    %ebx
     bb6:	5e                   	pop    %esi
     bb7:	5d                   	pop    %ebp
     bb8:	c3                   	ret    
      exit();
     bb9:	e8 ed 2c 00 00       	call   38ab <exit>
  for(i = 0; i < 100; i++){
     bbe:	83 c6 01             	add    $0x1,%esi
     bc1:	83 fe 63             	cmp    $0x63,%esi
     bc4:	7f 2a                	jg     bf0 <exitwait+0x60>
    pid = fork();
     bc6:	e8 d8 2c 00 00       	call   38a3 <fork>
     bcb:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     bcd:	85 c0                	test   %eax,%eax
     bcf:	78 cf                	js     ba0 <exitwait+0x10>
    if(pid){
     bd1:	74 e6                	je     bb9 <exitwait+0x29>
      if(wait() != pid){
     bd3:	e8 db 2c 00 00       	call   38b3 <wait>
     bd8:	39 d8                	cmp    %ebx,%eax
     bda:	74 e2                	je     bbe <exitwait+0x2e>
        printf(1, "wait wrong pid\n");
     bdc:	83 ec 08             	sub    $0x8,%esp
     bdf:	68 9f 40 00 00       	push   $0x409f
     be4:	6a 01                	push   $0x1
     be6:	e8 11 2e 00 00       	call   39fc <printf>
        return;
     beb:	83 c4 10             	add    $0x10,%esp
     bee:	eb c2                	jmp    bb2 <exitwait+0x22>
  printf(1, "exitwait ok\n");
     bf0:	83 ec 08             	sub    $0x8,%esp
     bf3:	68 af 40 00 00       	push   $0x40af
     bf8:	6a 01                	push   $0x1
     bfa:	e8 fd 2d 00 00       	call   39fc <printf>
     bff:	83 c4 10             	add    $0x10,%esp
     c02:	eb ae                	jmp    bb2 <exitwait+0x22>

00000c04 <mem>:

void
mem(void)
{
     c04:	f3 0f 1e fb          	endbr32 
     c08:	55                   	push   %ebp
     c09:	89 e5                	mov    %esp,%ebp
     c0b:	57                   	push   %edi
     c0c:	56                   	push   %esi
     c0d:	53                   	push   %ebx
     c0e:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     c11:	68 bc 40 00 00       	push   $0x40bc
     c16:	6a 01                	push   $0x1
     c18:	e8 df 2d 00 00       	call   39fc <printf>
  ppid = getpid();
     c1d:	e8 09 2d 00 00       	call   392b <getpid>
     c22:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     c24:	e8 7a 2c 00 00       	call   38a3 <fork>
     c29:	83 c4 10             	add    $0x10,%esp
     c2c:	85 c0                	test   %eax,%eax
     c2e:	0f 85 80 00 00 00    	jne    cb4 <mem+0xb0>
    m1 = 0;
     c34:	bb 00 00 00 00       	mov    $0x0,%ebx
    while((m2 = malloc(10001)) != 0){
     c39:	83 ec 0c             	sub    $0xc,%esp
     c3c:	68 11 27 00 00       	push   $0x2711
     c41:	e8 e7 2f 00 00       	call   3c2d <malloc>
     c46:	83 c4 10             	add    $0x10,%esp
     c49:	85 c0                	test   %eax,%eax
     c4b:	74 16                	je     c63 <mem+0x5f>
      *(char**)m2 = m1;
     c4d:	89 18                	mov    %ebx,(%eax)
      m1 = m2;
     c4f:	89 c3                	mov    %eax,%ebx
     c51:	eb e6                	jmp    c39 <mem+0x35>
    }
    while(m1){
      m2 = *(char**)m1;
     c53:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     c55:	83 ec 0c             	sub    $0xc,%esp
     c58:	53                   	push   %ebx
     c59:	e8 0b 2f 00 00       	call   3b69 <free>
     c5e:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     c61:	89 fb                	mov    %edi,%ebx
    while(m1){
     c63:	85 db                	test   %ebx,%ebx
     c65:	75 ec                	jne    c53 <mem+0x4f>
    }
    m1 = malloc(1024*20);
     c67:	83 ec 0c             	sub    $0xc,%esp
     c6a:	68 00 50 00 00       	push   $0x5000
     c6f:	e8 b9 2f 00 00       	call   3c2d <malloc>
    if(m1 == 0){
     c74:	83 c4 10             	add    $0x10,%esp
     c77:	85 c0                	test   %eax,%eax
     c79:	74 1d                	je     c98 <mem+0x94>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     c7b:	83 ec 0c             	sub    $0xc,%esp
     c7e:	50                   	push   %eax
     c7f:	e8 e5 2e 00 00       	call   3b69 <free>
    printf(1, "mem ok\n");
     c84:	83 c4 08             	add    $0x8,%esp
     c87:	68 e0 40 00 00       	push   $0x40e0
     c8c:	6a 01                	push   $0x1
     c8e:	e8 69 2d 00 00       	call   39fc <printf>
    exit();
     c93:	e8 13 2c 00 00       	call   38ab <exit>
      printf(1, "couldn't allocate mem?!!\n");
     c98:	83 ec 08             	sub    $0x8,%esp
     c9b:	68 c6 40 00 00       	push   $0x40c6
     ca0:	6a 01                	push   $0x1
     ca2:	e8 55 2d 00 00       	call   39fc <printf>
      kill(ppid);
     ca7:	89 34 24             	mov    %esi,(%esp)
     caa:	e8 2c 2c 00 00       	call   38db <kill>
      exit();
     caf:	e8 f7 2b 00 00       	call   38ab <exit>
  } else {
    wait();
     cb4:	e8 fa 2b 00 00       	call   38b3 <wait>
  }
}
     cb9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cbc:	5b                   	pop    %ebx
     cbd:	5e                   	pop    %esi
     cbe:	5f                   	pop    %edi
     cbf:	5d                   	pop    %ebp
     cc0:	c3                   	ret    

00000cc1 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     cc1:	f3 0f 1e fb          	endbr32 
     cc5:	55                   	push   %ebp
     cc6:	89 e5                	mov    %esp,%ebp
     cc8:	57                   	push   %edi
     cc9:	56                   	push   %esi
     cca:	53                   	push   %ebx
     ccb:	83 ec 24             	sub    $0x24,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     cce:	68 e8 40 00 00       	push   $0x40e8
     cd3:	6a 01                	push   $0x1
     cd5:	e8 22 2d 00 00       	call   39fc <printf>

  unlink("sharedfd");
     cda:	c7 04 24 f7 40 00 00 	movl   $0x40f7,(%esp)
     ce1:	e8 15 2c 00 00       	call   38fb <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ce6:	83 c4 08             	add    $0x8,%esp
     ce9:	68 02 02 00 00       	push   $0x202
     cee:	68 f7 40 00 00       	push   $0x40f7
     cf3:	e8 f3 2b 00 00       	call   38eb <open>
  if(fd < 0){
     cf8:	83 c4 10             	add    $0x10,%esp
     cfb:	85 c0                	test   %eax,%eax
     cfd:	78 4d                	js     d4c <sharedfd+0x8b>
     cff:	89 c6                	mov    %eax,%esi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     d01:	e8 9d 2b 00 00       	call   38a3 <fork>
     d06:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     d08:	85 c0                	test   %eax,%eax
     d0a:	75 57                	jne    d63 <sharedfd+0xa2>
     d0c:	b8 63 00 00 00       	mov    $0x63,%eax
     d11:	83 ec 04             	sub    $0x4,%esp
     d14:	6a 0a                	push   $0xa
     d16:	50                   	push   %eax
     d17:	8d 45 de             	lea    -0x22(%ebp),%eax
     d1a:	50                   	push   %eax
     d1b:	e8 65 29 00 00       	call   3685 <memset>
  for(i = 0; i < 1000; i++){
     d20:	83 c4 10             	add    $0x10,%esp
     d23:	bb 00 00 00 00       	mov    $0x0,%ebx
     d28:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
     d2e:	7f 4c                	jg     d7c <sharedfd+0xbb>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     d30:	83 ec 04             	sub    $0x4,%esp
     d33:	6a 0a                	push   $0xa
     d35:	8d 45 de             	lea    -0x22(%ebp),%eax
     d38:	50                   	push   %eax
     d39:	56                   	push   %esi
     d3a:	e8 8c 2b 00 00       	call   38cb <write>
     d3f:	83 c4 10             	add    $0x10,%esp
     d42:	83 f8 0a             	cmp    $0xa,%eax
     d45:	75 23                	jne    d6a <sharedfd+0xa9>
  for(i = 0; i < 1000; i++){
     d47:	83 c3 01             	add    $0x1,%ebx
     d4a:	eb dc                	jmp    d28 <sharedfd+0x67>
    printf(1, "fstests: cannot open sharedfd for writing");
     d4c:	83 ec 08             	sub    $0x8,%esp
     d4f:	68 bc 4d 00 00       	push   $0x4dbc
     d54:	6a 01                	push   $0x1
     d56:	e8 a1 2c 00 00       	call   39fc <printf>
    return;
     d5b:	83 c4 10             	add    $0x10,%esp
     d5e:	e9 e4 00 00 00       	jmp    e47 <sharedfd+0x186>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     d63:	b8 70 00 00 00       	mov    $0x70,%eax
     d68:	eb a7                	jmp    d11 <sharedfd+0x50>
      printf(1, "fstests: write sharedfd failed\n");
     d6a:	83 ec 08             	sub    $0x8,%esp
     d6d:	68 e8 4d 00 00       	push   $0x4de8
     d72:	6a 01                	push   $0x1
     d74:	e8 83 2c 00 00       	call   39fc <printf>
      break;
     d79:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     d7c:	85 ff                	test   %edi,%edi
     d7e:	74 4d                	je     dcd <sharedfd+0x10c>
    exit();
  else
    wait();
     d80:	e8 2e 2b 00 00       	call   38b3 <wait>
  close(fd);
     d85:	83 ec 0c             	sub    $0xc,%esp
     d88:	56                   	push   %esi
     d89:	e8 45 2b 00 00       	call   38d3 <close>
  fd = open("sharedfd", 0);
     d8e:	83 c4 08             	add    $0x8,%esp
     d91:	6a 00                	push   $0x0
     d93:	68 f7 40 00 00       	push   $0x40f7
     d98:	e8 4e 2b 00 00       	call   38eb <open>
     d9d:	89 c7                	mov    %eax,%edi
  if(fd < 0){
     d9f:	83 c4 10             	add    $0x10,%esp
     da2:	85 c0                	test   %eax,%eax
     da4:	78 2c                	js     dd2 <sharedfd+0x111>
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
     da6:	be 00 00 00 00       	mov    $0x0,%esi
     dab:	bb 00 00 00 00       	mov    $0x0,%ebx
  while((n = read(fd, buf, sizeof(buf))) > 0){
     db0:	83 ec 04             	sub    $0x4,%esp
     db3:	6a 0a                	push   $0xa
     db5:	8d 45 de             	lea    -0x22(%ebp),%eax
     db8:	50                   	push   %eax
     db9:	57                   	push   %edi
     dba:	e8 04 2b 00 00       	call   38c3 <read>
     dbf:	83 c4 10             	add    $0x10,%esp
     dc2:	85 c0                	test   %eax,%eax
     dc4:	7e 41                	jle    e07 <sharedfd+0x146>
    for(i = 0; i < sizeof(buf); i++){
     dc6:	b8 00 00 00 00       	mov    $0x0,%eax
     dcb:	eb 21                	jmp    dee <sharedfd+0x12d>
    exit();
     dcd:	e8 d9 2a 00 00       	call   38ab <exit>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     dd2:	83 ec 08             	sub    $0x8,%esp
     dd5:	68 08 4e 00 00       	push   $0x4e08
     dda:	6a 01                	push   $0x1
     ddc:	e8 1b 2c 00 00       	call   39fc <printf>
    return;
     de1:	83 c4 10             	add    $0x10,%esp
     de4:	eb 61                	jmp    e47 <sharedfd+0x186>
      if(buf[i] == 'c')
        nc++;
     de6:	83 c3 01             	add    $0x1,%ebx
     de9:	eb 12                	jmp    dfd <sharedfd+0x13c>
    for(i = 0; i < sizeof(buf); i++){
     deb:	83 c0 01             	add    $0x1,%eax
     dee:	83 f8 09             	cmp    $0x9,%eax
     df1:	77 bd                	ja     db0 <sharedfd+0xef>
      if(buf[i] == 'c')
     df3:	0f b6 54 05 de       	movzbl -0x22(%ebp,%eax,1),%edx
     df8:	80 fa 63             	cmp    $0x63,%dl
     dfb:	74 e9                	je     de6 <sharedfd+0x125>
      if(buf[i] == 'p')
     dfd:	80 fa 70             	cmp    $0x70,%dl
     e00:	75 e9                	jne    deb <sharedfd+0x12a>
        np++;
     e02:	83 c6 01             	add    $0x1,%esi
     e05:	eb e4                	jmp    deb <sharedfd+0x12a>
    }
  }
  close(fd);
     e07:	83 ec 0c             	sub    $0xc,%esp
     e0a:	57                   	push   %edi
     e0b:	e8 c3 2a 00 00       	call   38d3 <close>
  unlink("sharedfd");
     e10:	c7 04 24 f7 40 00 00 	movl   $0x40f7,(%esp)
     e17:	e8 df 2a 00 00       	call   38fb <unlink>
  if(nc == 10000 && np == 10000){
     e1c:	83 c4 10             	add    $0x10,%esp
     e1f:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     e25:	0f 94 c2             	sete   %dl
     e28:	81 fe 10 27 00 00    	cmp    $0x2710,%esi
     e2e:	0f 94 c0             	sete   %al
     e31:	84 c2                	test   %al,%dl
     e33:	74 1a                	je     e4f <sharedfd+0x18e>
    printf(1, "sharedfd ok\n");
     e35:	83 ec 08             	sub    $0x8,%esp
     e38:	68 00 41 00 00       	push   $0x4100
     e3d:	6a 01                	push   $0x1
     e3f:	e8 b8 2b 00 00       	call   39fc <printf>
     e44:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     e47:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e4a:	5b                   	pop    %ebx
     e4b:	5e                   	pop    %esi
     e4c:	5f                   	pop    %edi
     e4d:	5d                   	pop    %ebp
     e4e:	c3                   	ret    
    printf(1, "sharedfd oops %d %d\n", nc, np);
     e4f:	56                   	push   %esi
     e50:	53                   	push   %ebx
     e51:	68 0d 41 00 00       	push   $0x410d
     e56:	6a 01                	push   $0x1
     e58:	e8 9f 2b 00 00       	call   39fc <printf>
    exit();
     e5d:	e8 49 2a 00 00       	call   38ab <exit>

00000e62 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
     e62:	f3 0f 1e fb          	endbr32 
     e66:	55                   	push   %ebp
     e67:	89 e5                	mov    %esp,%ebp
     e69:	57                   	push   %edi
     e6a:	56                   	push   %esi
     e6b:	53                   	push   %ebx
     e6c:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
     e6f:	c7 45 d8 22 41 00 00 	movl   $0x4122,-0x28(%ebp)
     e76:	c7 45 dc 6b 42 00 00 	movl   $0x426b,-0x24(%ebp)
     e7d:	c7 45 e0 6f 42 00 00 	movl   $0x426f,-0x20(%ebp)
     e84:	c7 45 e4 25 41 00 00 	movl   $0x4125,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
     e8b:	68 28 41 00 00       	push   $0x4128
     e90:	6a 01                	push   $0x1
     e92:	e8 65 2b 00 00       	call   39fc <printf>

  for(pi = 0; pi < 4; pi++){
     e97:	83 c4 10             	add    $0x10,%esp
     e9a:	be 00 00 00 00       	mov    $0x0,%esi
     e9f:	83 fe 03             	cmp    $0x3,%esi
     ea2:	0f 8f bb 00 00 00    	jg     f63 <fourfiles+0x101>
    fname = names[pi];
     ea8:	8b 7c b5 d8          	mov    -0x28(%ebp,%esi,4),%edi
    unlink(fname);
     eac:	83 ec 0c             	sub    $0xc,%esp
     eaf:	57                   	push   %edi
     eb0:	e8 46 2a 00 00       	call   38fb <unlink>

    pid = fork();
     eb5:	e8 e9 29 00 00       	call   38a3 <fork>
    if(pid < 0){
     eba:	83 c4 10             	add    $0x10,%esp
     ebd:	85 c0                	test   %eax,%eax
     ebf:	78 07                	js     ec8 <fourfiles+0x66>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
     ec1:	74 19                	je     edc <fourfiles+0x7a>
  for(pi = 0; pi < 4; pi++){
     ec3:	83 c6 01             	add    $0x1,%esi
     ec6:	eb d7                	jmp    e9f <fourfiles+0x3d>
      printf(1, "fork failed\n");
     ec8:	83 ec 08             	sub    $0x8,%esp
     ecb:	68 fd 4b 00 00       	push   $0x4bfd
     ed0:	6a 01                	push   $0x1
     ed2:	e8 25 2b 00 00       	call   39fc <printf>
      exit();
     ed7:	e8 cf 29 00 00       	call   38ab <exit>
     edc:	89 c3                	mov    %eax,%ebx
      fd = open(fname, O_CREATE | O_RDWR);
     ede:	83 ec 08             	sub    $0x8,%esp
     ee1:	68 02 02 00 00       	push   $0x202
     ee6:	57                   	push   %edi
     ee7:	e8 ff 29 00 00       	call   38eb <open>
     eec:	89 c7                	mov    %eax,%edi
      if(fd < 0){
     eee:	83 c4 10             	add    $0x10,%esp
     ef1:	85 c0                	test   %eax,%eax
     ef3:	78 40                	js     f35 <fourfiles+0xd3>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
     ef5:	83 ec 04             	sub    $0x4,%esp
     ef8:	68 00 02 00 00       	push   $0x200
     efd:	83 c6 30             	add    $0x30,%esi
     f00:	56                   	push   %esi
     f01:	68 20 85 00 00       	push   $0x8520
     f06:	e8 7a 27 00 00       	call   3685 <memset>
      for(i = 0; i < 12; i++){
     f0b:	83 c4 10             	add    $0x10,%esp
     f0e:	83 fb 0b             	cmp    $0xb,%ebx
     f11:	7f 4b                	jg     f5e <fourfiles+0xfc>
        if((n = write(fd, buf, 500)) != 500){
     f13:	83 ec 04             	sub    $0x4,%esp
     f16:	68 f4 01 00 00       	push   $0x1f4
     f1b:	68 20 85 00 00       	push   $0x8520
     f20:	57                   	push   %edi
     f21:	e8 a5 29 00 00       	call   38cb <write>
     f26:	83 c4 10             	add    $0x10,%esp
     f29:	3d f4 01 00 00       	cmp    $0x1f4,%eax
     f2e:	75 19                	jne    f49 <fourfiles+0xe7>
      for(i = 0; i < 12; i++){
     f30:	83 c3 01             	add    $0x1,%ebx
     f33:	eb d9                	jmp    f0e <fourfiles+0xac>
        printf(1, "create failed\n");
     f35:	83 ec 08             	sub    $0x8,%esp
     f38:	68 c3 43 00 00       	push   $0x43c3
     f3d:	6a 01                	push   $0x1
     f3f:	e8 b8 2a 00 00       	call   39fc <printf>
        exit();
     f44:	e8 62 29 00 00       	call   38ab <exit>
          printf(1, "write failed %d\n", n);
     f49:	83 ec 04             	sub    $0x4,%esp
     f4c:	50                   	push   %eax
     f4d:	68 38 41 00 00       	push   $0x4138
     f52:	6a 01                	push   $0x1
     f54:	e8 a3 2a 00 00       	call   39fc <printf>
          exit();
     f59:	e8 4d 29 00 00       	call   38ab <exit>
        }
      }
      exit();
     f5e:	e8 48 29 00 00       	call   38ab <exit>
    }
  }

  for(pi = 0; pi < 4; pi++){
     f63:	bb 00 00 00 00       	mov    $0x0,%ebx
     f68:	eb 08                	jmp    f72 <fourfiles+0x110>
    wait();
     f6a:	e8 44 29 00 00       	call   38b3 <wait>
  for(pi = 0; pi < 4; pi++){
     f6f:	83 c3 01             	add    $0x1,%ebx
     f72:	83 fb 03             	cmp    $0x3,%ebx
     f75:	7e f3                	jle    f6a <fourfiles+0x108>
  }

  for(i = 0; i < 2; i++){
     f77:	bb 00 00 00 00       	mov    $0x0,%ebx
     f7c:	eb 75                	jmp    ff3 <fourfiles+0x191>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
     f7e:	83 ec 08             	sub    $0x8,%esp
     f81:	68 49 41 00 00       	push   $0x4149
     f86:	6a 01                	push   $0x1
     f88:	e8 6f 2a 00 00       	call   39fc <printf>
          exit();
     f8d:	e8 19 29 00 00       	call   38ab <exit>
        }
      }
      total += n;
     f92:	01 c6                	add    %eax,%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f94:	83 ec 04             	sub    $0x4,%esp
     f97:	68 00 20 00 00       	push   $0x2000
     f9c:	68 20 85 00 00       	push   $0x8520
     fa1:	ff 75 d4             	pushl  -0x2c(%ebp)
     fa4:	e8 1a 29 00 00       	call   38c3 <read>
     fa9:	83 c4 10             	add    $0x10,%esp
     fac:	85 c0                	test   %eax,%eax
     fae:	7e 1c                	jle    fcc <fourfiles+0x16a>
      for(j = 0; j < n; j++){
     fb0:	ba 00 00 00 00       	mov    $0x0,%edx
     fb5:	39 c2                	cmp    %eax,%edx
     fb7:	7d d9                	jge    f92 <fourfiles+0x130>
        if(buf[j] != '0'+i){
     fb9:	0f be ba 20 85 00 00 	movsbl 0x8520(%edx),%edi
     fc0:	8d 4b 30             	lea    0x30(%ebx),%ecx
     fc3:	39 cf                	cmp    %ecx,%edi
     fc5:	75 b7                	jne    f7e <fourfiles+0x11c>
      for(j = 0; j < n; j++){
     fc7:	83 c2 01             	add    $0x1,%edx
     fca:	eb e9                	jmp    fb5 <fourfiles+0x153>
    }
    close(fd);
     fcc:	83 ec 0c             	sub    $0xc,%esp
     fcf:	ff 75 d4             	pushl  -0x2c(%ebp)
     fd2:	e8 fc 28 00 00       	call   38d3 <close>
    if(total != 12*500){
     fd7:	83 c4 10             	add    $0x10,%esp
     fda:	81 fe 70 17 00 00    	cmp    $0x1770,%esi
     fe0:	75 38                	jne    101a <fourfiles+0x1b8>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
     fe2:	83 ec 0c             	sub    $0xc,%esp
     fe5:	ff 75 d0             	pushl  -0x30(%ebp)
     fe8:	e8 0e 29 00 00       	call   38fb <unlink>
  for(i = 0; i < 2; i++){
     fed:	83 c3 01             	add    $0x1,%ebx
     ff0:	83 c4 10             	add    $0x10,%esp
     ff3:	83 fb 01             	cmp    $0x1,%ebx
     ff6:	7f 37                	jg     102f <fourfiles+0x1cd>
    fname = names[i];
     ff8:	8b 44 9d d8          	mov    -0x28(%ebp,%ebx,4),%eax
     ffc:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
     fff:	83 ec 08             	sub    $0x8,%esp
    1002:	6a 00                	push   $0x0
    1004:	50                   	push   %eax
    1005:	e8 e1 28 00 00       	call   38eb <open>
    100a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    100d:	83 c4 10             	add    $0x10,%esp
    total = 0;
    1010:	be 00 00 00 00       	mov    $0x0,%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1015:	e9 7a ff ff ff       	jmp    f94 <fourfiles+0x132>
      printf(1, "wrong length %d\n", total);
    101a:	83 ec 04             	sub    $0x4,%esp
    101d:	56                   	push   %esi
    101e:	68 55 41 00 00       	push   $0x4155
    1023:	6a 01                	push   $0x1
    1025:	e8 d2 29 00 00       	call   39fc <printf>
      exit();
    102a:	e8 7c 28 00 00       	call   38ab <exit>
  }

  printf(1, "fourfiles ok\n");
    102f:	83 ec 08             	sub    $0x8,%esp
    1032:	68 66 41 00 00       	push   $0x4166
    1037:	6a 01                	push   $0x1
    1039:	e8 be 29 00 00       	call   39fc <printf>
}
    103e:	83 c4 10             	add    $0x10,%esp
    1041:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1044:	5b                   	pop    %ebx
    1045:	5e                   	pop    %esi
    1046:	5f                   	pop    %edi
    1047:	5d                   	pop    %ebp
    1048:	c3                   	ret    

00001049 <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1049:	f3 0f 1e fb          	endbr32 
    104d:	55                   	push   %ebp
    104e:	89 e5                	mov    %esp,%ebp
    1050:	56                   	push   %esi
    1051:	53                   	push   %ebx
    1052:	83 ec 28             	sub    $0x28,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    1055:	68 74 41 00 00       	push   $0x4174
    105a:	6a 01                	push   $0x1
    105c:	e8 9b 29 00 00       	call   39fc <printf>

  for(pi = 0; pi < 4; pi++){
    1061:	83 c4 10             	add    $0x10,%esp
    1064:	be 00 00 00 00       	mov    $0x0,%esi
    1069:	83 fe 03             	cmp    $0x3,%esi
    106c:	0f 8f bc 00 00 00    	jg     112e <createdelete+0xe5>
    pid = fork();
    1072:	e8 2c 28 00 00       	call   38a3 <fork>
    1077:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1079:	85 c0                	test   %eax,%eax
    107b:	78 07                	js     1084 <createdelete+0x3b>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    107d:	74 19                	je     1098 <createdelete+0x4f>
  for(pi = 0; pi < 4; pi++){
    107f:	83 c6 01             	add    $0x1,%esi
    1082:	eb e5                	jmp    1069 <createdelete+0x20>
      printf(1, "fork failed\n");
    1084:	83 ec 08             	sub    $0x8,%esp
    1087:	68 fd 4b 00 00       	push   $0x4bfd
    108c:	6a 01                	push   $0x1
    108e:	e8 69 29 00 00       	call   39fc <printf>
      exit();
    1093:	e8 13 28 00 00       	call   38ab <exit>
      name[0] = 'p' + pi;
    1098:	8d 46 70             	lea    0x70(%esi),%eax
    109b:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[2] = '\0';
    109e:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
      for(i = 0; i < N; i++){
    10a2:	eb 17                	jmp    10bb <createdelete+0x72>
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    10a4:	83 ec 08             	sub    $0x8,%esp
    10a7:	68 c3 43 00 00       	push   $0x43c3
    10ac:	6a 01                	push   $0x1
    10ae:	e8 49 29 00 00       	call   39fc <printf>
          exit();
    10b3:	e8 f3 27 00 00       	call   38ab <exit>
      for(i = 0; i < N; i++){
    10b8:	83 c3 01             	add    $0x1,%ebx
    10bb:	83 fb 13             	cmp    $0x13,%ebx
    10be:	7f 69                	jg     1129 <createdelete+0xe0>
        name[1] = '0' + i;
    10c0:	8d 43 30             	lea    0x30(%ebx),%eax
    10c3:	88 45 d9             	mov    %al,-0x27(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    10c6:	83 ec 08             	sub    $0x8,%esp
    10c9:	68 02 02 00 00       	push   $0x202
    10ce:	8d 45 d8             	lea    -0x28(%ebp),%eax
    10d1:	50                   	push   %eax
    10d2:	e8 14 28 00 00       	call   38eb <open>
        if(fd < 0){
    10d7:	83 c4 10             	add    $0x10,%esp
    10da:	85 c0                	test   %eax,%eax
    10dc:	78 c6                	js     10a4 <createdelete+0x5b>
        }
        close(fd);
    10de:	83 ec 0c             	sub    $0xc,%esp
    10e1:	50                   	push   %eax
    10e2:	e8 ec 27 00 00       	call   38d3 <close>
        if(i > 0 && (i % 2 ) == 0){
    10e7:	83 c4 10             	add    $0x10,%esp
    10ea:	85 db                	test   %ebx,%ebx
    10ec:	7e ca                	jle    10b8 <createdelete+0x6f>
    10ee:	f6 c3 01             	test   $0x1,%bl
    10f1:	75 c5                	jne    10b8 <createdelete+0x6f>
          name[1] = '0' + (i / 2);
    10f3:	89 d8                	mov    %ebx,%eax
    10f5:	c1 e8 1f             	shr    $0x1f,%eax
    10f8:	01 d8                	add    %ebx,%eax
    10fa:	d1 f8                	sar    %eax
    10fc:	83 c0 30             	add    $0x30,%eax
    10ff:	88 45 d9             	mov    %al,-0x27(%ebp)
          if(unlink(name) < 0){
    1102:	83 ec 0c             	sub    $0xc,%esp
    1105:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1108:	50                   	push   %eax
    1109:	e8 ed 27 00 00       	call   38fb <unlink>
    110e:	83 c4 10             	add    $0x10,%esp
    1111:	85 c0                	test   %eax,%eax
    1113:	79 a3                	jns    10b8 <createdelete+0x6f>
            printf(1, "unlink failed\n");
    1115:	83 ec 08             	sub    $0x8,%esp
    1118:	68 75 3d 00 00       	push   $0x3d75
    111d:	6a 01                	push   $0x1
    111f:	e8 d8 28 00 00       	call   39fc <printf>
            exit();
    1124:	e8 82 27 00 00       	call   38ab <exit>
          }
        }
      }
      exit();
    1129:	e8 7d 27 00 00       	call   38ab <exit>
    }
  }

  for(pi = 0; pi < 4; pi++){
    112e:	bb 00 00 00 00       	mov    $0x0,%ebx
    1133:	eb 08                	jmp    113d <createdelete+0xf4>
    wait();
    1135:	e8 79 27 00 00       	call   38b3 <wait>
  for(pi = 0; pi < 4; pi++){
    113a:	83 c3 01             	add    $0x1,%ebx
    113d:	83 fb 03             	cmp    $0x3,%ebx
    1140:	7e f3                	jle    1135 <createdelete+0xec>
  }

  name[0] = name[1] = name[2] = 0;
    1142:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    1146:	c6 45 d9 00          	movb   $0x0,-0x27(%ebp)
    114a:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
  for(i = 0; i < N; i++){
    114e:	bb 00 00 00 00       	mov    $0x0,%ebx
    1153:	e9 89 00 00 00       	jmp    11e1 <createdelete+0x198>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1158:	8d 53 ff             	lea    -0x1(%ebx),%edx
    115b:	83 fa 08             	cmp    $0x8,%edx
    115e:	76 54                	jbe    11b4 <createdelete+0x16b>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    1160:	85 c0                	test   %eax,%eax
    1162:	79 6c                	jns    11d0 <createdelete+0x187>
    for(pi = 0; pi < 4; pi++){
    1164:	83 c6 01             	add    $0x1,%esi
    1167:	83 fe 03             	cmp    $0x3,%esi
    116a:	7f 72                	jg     11de <createdelete+0x195>
      name[0] = 'p' + pi;
    116c:	8d 46 70             	lea    0x70(%esi),%eax
    116f:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[1] = '0' + i;
    1172:	8d 43 30             	lea    0x30(%ebx),%eax
    1175:	88 45 d9             	mov    %al,-0x27(%ebp)
      fd = open(name, 0);
    1178:	83 ec 08             	sub    $0x8,%esp
    117b:	6a 00                	push   $0x0
    117d:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1180:	50                   	push   %eax
    1181:	e8 65 27 00 00       	call   38eb <open>
      if((i == 0 || i >= N/2) && fd < 0){
    1186:	83 c4 10             	add    $0x10,%esp
    1189:	85 db                	test   %ebx,%ebx
    118b:	0f 94 c1             	sete   %cl
    118e:	83 fb 09             	cmp    $0x9,%ebx
    1191:	0f 9f c2             	setg   %dl
    1194:	08 d1                	or     %dl,%cl
    1196:	74 c0                	je     1158 <createdelete+0x10f>
    1198:	85 c0                	test   %eax,%eax
    119a:	79 bc                	jns    1158 <createdelete+0x10f>
        printf(1, "oops createdelete %s didn't exist\n", name);
    119c:	83 ec 04             	sub    $0x4,%esp
    119f:	8d 45 d8             	lea    -0x28(%ebp),%eax
    11a2:	50                   	push   %eax
    11a3:	68 34 4e 00 00       	push   $0x4e34
    11a8:	6a 01                	push   $0x1
    11aa:	e8 4d 28 00 00       	call   39fc <printf>
        exit();
    11af:	e8 f7 26 00 00       	call   38ab <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    11b4:	85 c0                	test   %eax,%eax
    11b6:	78 a8                	js     1160 <createdelete+0x117>
        printf(1, "oops createdelete %s did exist\n", name);
    11b8:	83 ec 04             	sub    $0x4,%esp
    11bb:	8d 45 d8             	lea    -0x28(%ebp),%eax
    11be:	50                   	push   %eax
    11bf:	68 58 4e 00 00       	push   $0x4e58
    11c4:	6a 01                	push   $0x1
    11c6:	e8 31 28 00 00       	call   39fc <printf>
        exit();
    11cb:	e8 db 26 00 00       	call   38ab <exit>
        close(fd);
    11d0:	83 ec 0c             	sub    $0xc,%esp
    11d3:	50                   	push   %eax
    11d4:	e8 fa 26 00 00       	call   38d3 <close>
    11d9:	83 c4 10             	add    $0x10,%esp
    11dc:	eb 86                	jmp    1164 <createdelete+0x11b>
  for(i = 0; i < N; i++){
    11de:	83 c3 01             	add    $0x1,%ebx
    11e1:	83 fb 13             	cmp    $0x13,%ebx
    11e4:	7f 0a                	jg     11f0 <createdelete+0x1a7>
    for(pi = 0; pi < 4; pi++){
    11e6:	be 00 00 00 00       	mov    $0x0,%esi
    11eb:	e9 77 ff ff ff       	jmp    1167 <createdelete+0x11e>
    }
  }

  for(i = 0; i < N; i++){
    11f0:	be 00 00 00 00       	mov    $0x0,%esi
    11f5:	eb 26                	jmp    121d <createdelete+0x1d4>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    11f7:	8d 46 70             	lea    0x70(%esi),%eax
    11fa:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[1] = '0' + i;
    11fd:	8d 46 30             	lea    0x30(%esi),%eax
    1200:	88 45 d9             	mov    %al,-0x27(%ebp)
      unlink(name);
    1203:	83 ec 0c             	sub    $0xc,%esp
    1206:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1209:	50                   	push   %eax
    120a:	e8 ec 26 00 00       	call   38fb <unlink>
    for(pi = 0; pi < 4; pi++){
    120f:	83 c3 01             	add    $0x1,%ebx
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	83 fb 03             	cmp    $0x3,%ebx
    1218:	7e dd                	jle    11f7 <createdelete+0x1ae>
  for(i = 0; i < N; i++){
    121a:	83 c6 01             	add    $0x1,%esi
    121d:	83 fe 13             	cmp    $0x13,%esi
    1220:	7f 07                	jg     1229 <createdelete+0x1e0>
    for(pi = 0; pi < 4; pi++){
    1222:	bb 00 00 00 00       	mov    $0x0,%ebx
    1227:	eb ec                	jmp    1215 <createdelete+0x1cc>
    }
  }

  printf(1, "createdelete ok\n");
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	68 87 41 00 00       	push   $0x4187
    1231:	6a 01                	push   $0x1
    1233:	e8 c4 27 00 00       	call   39fc <printf>
}
    1238:	83 c4 10             	add    $0x10,%esp
    123b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    123e:	5b                   	pop    %ebx
    123f:	5e                   	pop    %esi
    1240:	5d                   	pop    %ebp
    1241:	c3                   	ret    

00001242 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1242:	f3 0f 1e fb          	endbr32 
    1246:	55                   	push   %ebp
    1247:	89 e5                	mov    %esp,%ebp
    1249:	56                   	push   %esi
    124a:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    124b:	83 ec 08             	sub    $0x8,%esp
    124e:	68 98 41 00 00       	push   $0x4198
    1253:	6a 01                	push   $0x1
    1255:	e8 a2 27 00 00       	call   39fc <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    125a:	83 c4 08             	add    $0x8,%esp
    125d:	68 02 02 00 00       	push   $0x202
    1262:	68 a9 41 00 00       	push   $0x41a9
    1267:	e8 7f 26 00 00       	call   38eb <open>
  if(fd < 0){
    126c:	83 c4 10             	add    $0x10,%esp
    126f:	85 c0                	test   %eax,%eax
    1271:	0f 88 f0 00 00 00    	js     1367 <unlinkread+0x125>
    1277:	89 c3                	mov    %eax,%ebx
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1279:	83 ec 04             	sub    $0x4,%esp
    127c:	6a 05                	push   $0x5
    127e:	68 ce 41 00 00       	push   $0x41ce
    1283:	50                   	push   %eax
    1284:	e8 42 26 00 00       	call   38cb <write>
  close(fd);
    1289:	89 1c 24             	mov    %ebx,(%esp)
    128c:	e8 42 26 00 00       	call   38d3 <close>

  fd = open("unlinkread", O_RDWR);
    1291:	83 c4 08             	add    $0x8,%esp
    1294:	6a 02                	push   $0x2
    1296:	68 a9 41 00 00       	push   $0x41a9
    129b:	e8 4b 26 00 00       	call   38eb <open>
    12a0:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    12a2:	83 c4 10             	add    $0x10,%esp
    12a5:	85 c0                	test   %eax,%eax
    12a7:	0f 88 ce 00 00 00    	js     137b <unlinkread+0x139>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    12ad:	83 ec 0c             	sub    $0xc,%esp
    12b0:	68 a9 41 00 00       	push   $0x41a9
    12b5:	e8 41 26 00 00       	call   38fb <unlink>
    12ba:	83 c4 10             	add    $0x10,%esp
    12bd:	85 c0                	test   %eax,%eax
    12bf:	0f 85 ca 00 00 00    	jne    138f <unlinkread+0x14d>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    12c5:	83 ec 08             	sub    $0x8,%esp
    12c8:	68 02 02 00 00       	push   $0x202
    12cd:	68 a9 41 00 00       	push   $0x41a9
    12d2:	e8 14 26 00 00       	call   38eb <open>
    12d7:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    12d9:	83 c4 0c             	add    $0xc,%esp
    12dc:	6a 03                	push   $0x3
    12de:	68 06 42 00 00       	push   $0x4206
    12e3:	50                   	push   %eax
    12e4:	e8 e2 25 00 00       	call   38cb <write>
  close(fd1);
    12e9:	89 34 24             	mov    %esi,(%esp)
    12ec:	e8 e2 25 00 00       	call   38d3 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    12f1:	83 c4 0c             	add    $0xc,%esp
    12f4:	68 00 20 00 00       	push   $0x2000
    12f9:	68 20 85 00 00       	push   $0x8520
    12fe:	53                   	push   %ebx
    12ff:	e8 bf 25 00 00       	call   38c3 <read>
    1304:	83 c4 10             	add    $0x10,%esp
    1307:	83 f8 05             	cmp    $0x5,%eax
    130a:	0f 85 93 00 00 00    	jne    13a3 <unlinkread+0x161>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    1310:	80 3d 20 85 00 00 68 	cmpb   $0x68,0x8520
    1317:	0f 85 9a 00 00 00    	jne    13b7 <unlinkread+0x175>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    131d:	83 ec 04             	sub    $0x4,%esp
    1320:	6a 0a                	push   $0xa
    1322:	68 20 85 00 00       	push   $0x8520
    1327:	53                   	push   %ebx
    1328:	e8 9e 25 00 00       	call   38cb <write>
    132d:	83 c4 10             	add    $0x10,%esp
    1330:	83 f8 0a             	cmp    $0xa,%eax
    1333:	0f 85 92 00 00 00    	jne    13cb <unlinkread+0x189>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    1339:	83 ec 0c             	sub    $0xc,%esp
    133c:	53                   	push   %ebx
    133d:	e8 91 25 00 00       	call   38d3 <close>
  unlink("unlinkread");
    1342:	c7 04 24 a9 41 00 00 	movl   $0x41a9,(%esp)
    1349:	e8 ad 25 00 00       	call   38fb <unlink>
  printf(1, "unlinkread ok\n");
    134e:	83 c4 08             	add    $0x8,%esp
    1351:	68 51 42 00 00       	push   $0x4251
    1356:	6a 01                	push   $0x1
    1358:	e8 9f 26 00 00       	call   39fc <printf>
}
    135d:	83 c4 10             	add    $0x10,%esp
    1360:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1363:	5b                   	pop    %ebx
    1364:	5e                   	pop    %esi
    1365:	5d                   	pop    %ebp
    1366:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1367:	83 ec 08             	sub    $0x8,%esp
    136a:	68 b4 41 00 00       	push   $0x41b4
    136f:	6a 01                	push   $0x1
    1371:	e8 86 26 00 00       	call   39fc <printf>
    exit();
    1376:	e8 30 25 00 00       	call   38ab <exit>
    printf(1, "open unlinkread failed\n");
    137b:	83 ec 08             	sub    $0x8,%esp
    137e:	68 d4 41 00 00       	push   $0x41d4
    1383:	6a 01                	push   $0x1
    1385:	e8 72 26 00 00       	call   39fc <printf>
    exit();
    138a:	e8 1c 25 00 00       	call   38ab <exit>
    printf(1, "unlink unlinkread failed\n");
    138f:	83 ec 08             	sub    $0x8,%esp
    1392:	68 ec 41 00 00       	push   $0x41ec
    1397:	6a 01                	push   $0x1
    1399:	e8 5e 26 00 00       	call   39fc <printf>
    exit();
    139e:	e8 08 25 00 00       	call   38ab <exit>
    printf(1, "unlinkread read failed");
    13a3:	83 ec 08             	sub    $0x8,%esp
    13a6:	68 0a 42 00 00       	push   $0x420a
    13ab:	6a 01                	push   $0x1
    13ad:	e8 4a 26 00 00       	call   39fc <printf>
    exit();
    13b2:	e8 f4 24 00 00       	call   38ab <exit>
    printf(1, "unlinkread wrong data\n");
    13b7:	83 ec 08             	sub    $0x8,%esp
    13ba:	68 21 42 00 00       	push   $0x4221
    13bf:	6a 01                	push   $0x1
    13c1:	e8 36 26 00 00       	call   39fc <printf>
    exit();
    13c6:	e8 e0 24 00 00       	call   38ab <exit>
    printf(1, "unlinkread write failed\n");
    13cb:	83 ec 08             	sub    $0x8,%esp
    13ce:	68 38 42 00 00       	push   $0x4238
    13d3:	6a 01                	push   $0x1
    13d5:	e8 22 26 00 00       	call   39fc <printf>
    exit();
    13da:	e8 cc 24 00 00       	call   38ab <exit>

000013df <linktest>:

void
linktest(void)
{
    13df:	f3 0f 1e fb          	endbr32 
    13e3:	55                   	push   %ebp
    13e4:	89 e5                	mov    %esp,%ebp
    13e6:	53                   	push   %ebx
    13e7:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    13ea:	68 60 42 00 00       	push   $0x4260
    13ef:	6a 01                	push   $0x1
    13f1:	e8 06 26 00 00       	call   39fc <printf>

  unlink("lf1");
    13f6:	c7 04 24 6a 42 00 00 	movl   $0x426a,(%esp)
    13fd:	e8 f9 24 00 00       	call   38fb <unlink>
  unlink("lf2");
    1402:	c7 04 24 6e 42 00 00 	movl   $0x426e,(%esp)
    1409:	e8 ed 24 00 00       	call   38fb <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    140e:	83 c4 08             	add    $0x8,%esp
    1411:	68 02 02 00 00       	push   $0x202
    1416:	68 6a 42 00 00       	push   $0x426a
    141b:	e8 cb 24 00 00       	call   38eb <open>
  if(fd < 0){
    1420:	83 c4 10             	add    $0x10,%esp
    1423:	85 c0                	test   %eax,%eax
    1425:	0f 88 2a 01 00 00    	js     1555 <linktest+0x176>
    142b:	89 c3                	mov    %eax,%ebx
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    142d:	83 ec 04             	sub    $0x4,%esp
    1430:	6a 05                	push   $0x5
    1432:	68 ce 41 00 00       	push   $0x41ce
    1437:	50                   	push   %eax
    1438:	e8 8e 24 00 00       	call   38cb <write>
    143d:	83 c4 10             	add    $0x10,%esp
    1440:	83 f8 05             	cmp    $0x5,%eax
    1443:	0f 85 20 01 00 00    	jne    1569 <linktest+0x18a>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1449:	83 ec 0c             	sub    $0xc,%esp
    144c:	53                   	push   %ebx
    144d:	e8 81 24 00 00       	call   38d3 <close>

  if(link("lf1", "lf2") < 0){
    1452:	83 c4 08             	add    $0x8,%esp
    1455:	68 6e 42 00 00       	push   $0x426e
    145a:	68 6a 42 00 00       	push   $0x426a
    145f:	e8 a7 24 00 00       	call   390b <link>
    1464:	83 c4 10             	add    $0x10,%esp
    1467:	85 c0                	test   %eax,%eax
    1469:	0f 88 0e 01 00 00    	js     157d <linktest+0x19e>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    146f:	83 ec 0c             	sub    $0xc,%esp
    1472:	68 6a 42 00 00       	push   $0x426a
    1477:	e8 7f 24 00 00       	call   38fb <unlink>

  if(open("lf1", 0) >= 0){
    147c:	83 c4 08             	add    $0x8,%esp
    147f:	6a 00                	push   $0x0
    1481:	68 6a 42 00 00       	push   $0x426a
    1486:	e8 60 24 00 00       	call   38eb <open>
    148b:	83 c4 10             	add    $0x10,%esp
    148e:	85 c0                	test   %eax,%eax
    1490:	0f 89 fb 00 00 00    	jns    1591 <linktest+0x1b2>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1496:	83 ec 08             	sub    $0x8,%esp
    1499:	6a 00                	push   $0x0
    149b:	68 6e 42 00 00       	push   $0x426e
    14a0:	e8 46 24 00 00       	call   38eb <open>
    14a5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    14a7:	83 c4 10             	add    $0x10,%esp
    14aa:	85 c0                	test   %eax,%eax
    14ac:	0f 88 f3 00 00 00    	js     15a5 <linktest+0x1c6>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    14b2:	83 ec 04             	sub    $0x4,%esp
    14b5:	68 00 20 00 00       	push   $0x2000
    14ba:	68 20 85 00 00       	push   $0x8520
    14bf:	50                   	push   %eax
    14c0:	e8 fe 23 00 00       	call   38c3 <read>
    14c5:	83 c4 10             	add    $0x10,%esp
    14c8:	83 f8 05             	cmp    $0x5,%eax
    14cb:	0f 85 e8 00 00 00    	jne    15b9 <linktest+0x1da>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    14d1:	83 ec 0c             	sub    $0xc,%esp
    14d4:	53                   	push   %ebx
    14d5:	e8 f9 23 00 00       	call   38d3 <close>

  if(link("lf2", "lf2") >= 0){
    14da:	83 c4 08             	add    $0x8,%esp
    14dd:	68 6e 42 00 00       	push   $0x426e
    14e2:	68 6e 42 00 00       	push   $0x426e
    14e7:	e8 1f 24 00 00       	call   390b <link>
    14ec:	83 c4 10             	add    $0x10,%esp
    14ef:	85 c0                	test   %eax,%eax
    14f1:	0f 89 d6 00 00 00    	jns    15cd <linktest+0x1ee>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    14f7:	83 ec 0c             	sub    $0xc,%esp
    14fa:	68 6e 42 00 00       	push   $0x426e
    14ff:	e8 f7 23 00 00       	call   38fb <unlink>
  if(link("lf2", "lf1") >= 0){
    1504:	83 c4 08             	add    $0x8,%esp
    1507:	68 6a 42 00 00       	push   $0x426a
    150c:	68 6e 42 00 00       	push   $0x426e
    1511:	e8 f5 23 00 00       	call   390b <link>
    1516:	83 c4 10             	add    $0x10,%esp
    1519:	85 c0                	test   %eax,%eax
    151b:	0f 89 c0 00 00 00    	jns    15e1 <linktest+0x202>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    1521:	83 ec 08             	sub    $0x8,%esp
    1524:	68 6a 42 00 00       	push   $0x426a
    1529:	68 32 45 00 00       	push   $0x4532
    152e:	e8 d8 23 00 00       	call   390b <link>
    1533:	83 c4 10             	add    $0x10,%esp
    1536:	85 c0                	test   %eax,%eax
    1538:	0f 89 b7 00 00 00    	jns    15f5 <linktest+0x216>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    153e:	83 ec 08             	sub    $0x8,%esp
    1541:	68 08 43 00 00       	push   $0x4308
    1546:	6a 01                	push   $0x1
    1548:	e8 af 24 00 00       	call   39fc <printf>
}
    154d:	83 c4 10             	add    $0x10,%esp
    1550:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1553:	c9                   	leave  
    1554:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1555:	83 ec 08             	sub    $0x8,%esp
    1558:	68 72 42 00 00       	push   $0x4272
    155d:	6a 01                	push   $0x1
    155f:	e8 98 24 00 00       	call   39fc <printf>
    exit();
    1564:	e8 42 23 00 00       	call   38ab <exit>
    printf(1, "write lf1 failed\n");
    1569:	83 ec 08             	sub    $0x8,%esp
    156c:	68 85 42 00 00       	push   $0x4285
    1571:	6a 01                	push   $0x1
    1573:	e8 84 24 00 00       	call   39fc <printf>
    exit();
    1578:	e8 2e 23 00 00       	call   38ab <exit>
    printf(1, "link lf1 lf2 failed\n");
    157d:	83 ec 08             	sub    $0x8,%esp
    1580:	68 97 42 00 00       	push   $0x4297
    1585:	6a 01                	push   $0x1
    1587:	e8 70 24 00 00       	call   39fc <printf>
    exit();
    158c:	e8 1a 23 00 00       	call   38ab <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    1591:	83 ec 08             	sub    $0x8,%esp
    1594:	68 78 4e 00 00       	push   $0x4e78
    1599:	6a 01                	push   $0x1
    159b:	e8 5c 24 00 00       	call   39fc <printf>
    exit();
    15a0:	e8 06 23 00 00       	call   38ab <exit>
    printf(1, "open lf2 failed\n");
    15a5:	83 ec 08             	sub    $0x8,%esp
    15a8:	68 ac 42 00 00       	push   $0x42ac
    15ad:	6a 01                	push   $0x1
    15af:	e8 48 24 00 00       	call   39fc <printf>
    exit();
    15b4:	e8 f2 22 00 00       	call   38ab <exit>
    printf(1, "read lf2 failed\n");
    15b9:	83 ec 08             	sub    $0x8,%esp
    15bc:	68 bd 42 00 00       	push   $0x42bd
    15c1:	6a 01                	push   $0x1
    15c3:	e8 34 24 00 00       	call   39fc <printf>
    exit();
    15c8:	e8 de 22 00 00       	call   38ab <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    15cd:	83 ec 08             	sub    $0x8,%esp
    15d0:	68 ce 42 00 00       	push   $0x42ce
    15d5:	6a 01                	push   $0x1
    15d7:	e8 20 24 00 00       	call   39fc <printf>
    exit();
    15dc:	e8 ca 22 00 00       	call   38ab <exit>
    printf(1, "link non-existant succeeded! oops\n");
    15e1:	83 ec 08             	sub    $0x8,%esp
    15e4:	68 a0 4e 00 00       	push   $0x4ea0
    15e9:	6a 01                	push   $0x1
    15eb:	e8 0c 24 00 00       	call   39fc <printf>
    exit();
    15f0:	e8 b6 22 00 00       	call   38ab <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    15f5:	83 ec 08             	sub    $0x8,%esp
    15f8:	68 ec 42 00 00       	push   $0x42ec
    15fd:	6a 01                	push   $0x1
    15ff:	e8 f8 23 00 00       	call   39fc <printf>
    exit();
    1604:	e8 a2 22 00 00       	call   38ab <exit>

00001609 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1609:	f3 0f 1e fb          	endbr32 
    160d:	55                   	push   %ebp
    160e:	89 e5                	mov    %esp,%ebp
    1610:	57                   	push   %edi
    1611:	56                   	push   %esi
    1612:	53                   	push   %ebx
    1613:	83 ec 54             	sub    $0x54,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1616:	68 15 43 00 00       	push   $0x4315
    161b:	6a 01                	push   $0x1
    161d:	e8 da 23 00 00       	call   39fc <printf>
  file[0] = 'C';
    1622:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    1626:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    162a:	83 c4 10             	add    $0x10,%esp
    162d:	bb 00 00 00 00       	mov    $0x0,%ebx
    1632:	eb 5e                	jmp    1692 <concreate+0x89>
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1634:	85 f6                	test   %esi,%esi
    1636:	75 22                	jne    165a <concreate+0x51>
    1638:	ba 67 66 66 66       	mov    $0x66666667,%edx
    163d:	89 d8                	mov    %ebx,%eax
    163f:	f7 ea                	imul   %edx
    1641:	d1 fa                	sar    %edx
    1643:	89 d8                	mov    %ebx,%eax
    1645:	c1 f8 1f             	sar    $0x1f,%eax
    1648:	29 c2                	sub    %eax,%edx
    164a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    164d:	89 da                	mov    %ebx,%edx
    164f:	29 c2                	sub    %eax,%edx
    1651:	83 fa 01             	cmp    $0x1,%edx
    1654:	0f 84 9b 00 00 00    	je     16f5 <concreate+0xec>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    165a:	83 ec 08             	sub    $0x8,%esp
    165d:	68 02 02 00 00       	push   $0x202
    1662:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1665:	50                   	push   %eax
    1666:	e8 80 22 00 00       	call   38eb <open>
      if(fd < 0){
    166b:	83 c4 10             	add    $0x10,%esp
    166e:	85 c0                	test   %eax,%eax
    1670:	0f 88 98 00 00 00    	js     170e <concreate+0x105>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1676:	83 ec 0c             	sub    $0xc,%esp
    1679:	50                   	push   %eax
    167a:	e8 54 22 00 00       	call   38d3 <close>
    167f:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1682:	85 f6                	test   %esi,%esi
    1684:	0f 84 9c 00 00 00    	je     1726 <concreate+0x11d>
      exit();
    else
      wait();
    168a:	e8 24 22 00 00       	call   38b3 <wait>
  for(i = 0; i < 40; i++){
    168f:	83 c3 01             	add    $0x1,%ebx
    1692:	83 fb 27             	cmp    $0x27,%ebx
    1695:	0f 8f 90 00 00 00    	jg     172b <concreate+0x122>
    file[1] = '0' + i;
    169b:	8d 43 30             	lea    0x30(%ebx),%eax
    169e:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    16a1:	83 ec 0c             	sub    $0xc,%esp
    16a4:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16a7:	50                   	push   %eax
    16a8:	e8 4e 22 00 00       	call   38fb <unlink>
    pid = fork();
    16ad:	e8 f1 21 00 00       	call   38a3 <fork>
    16b2:	89 c6                	mov    %eax,%esi
    if(pid && (i % 3) == 1){
    16b4:	83 c4 10             	add    $0x10,%esp
    16b7:	85 c0                	test   %eax,%eax
    16b9:	0f 84 75 ff ff ff    	je     1634 <concreate+0x2b>
    16bf:	ba 56 55 55 55       	mov    $0x55555556,%edx
    16c4:	89 d8                	mov    %ebx,%eax
    16c6:	f7 ea                	imul   %edx
    16c8:	89 d8                	mov    %ebx,%eax
    16ca:	c1 f8 1f             	sar    $0x1f,%eax
    16cd:	29 c2                	sub    %eax,%edx
    16cf:	8d 04 52             	lea    (%edx,%edx,2),%eax
    16d2:	89 da                	mov    %ebx,%edx
    16d4:	29 c2                	sub    %eax,%edx
    16d6:	83 fa 01             	cmp    $0x1,%edx
    16d9:	0f 85 55 ff ff ff    	jne    1634 <concreate+0x2b>
      link("C0", file);
    16df:	83 ec 08             	sub    $0x8,%esp
    16e2:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16e5:	50                   	push   %eax
    16e6:	68 25 43 00 00       	push   $0x4325
    16eb:	e8 1b 22 00 00       	call   390b <link>
    16f0:	83 c4 10             	add    $0x10,%esp
    16f3:	eb 8d                	jmp    1682 <concreate+0x79>
      link("C0", file);
    16f5:	83 ec 08             	sub    $0x8,%esp
    16f8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16fb:	50                   	push   %eax
    16fc:	68 25 43 00 00       	push   $0x4325
    1701:	e8 05 22 00 00       	call   390b <link>
    1706:	83 c4 10             	add    $0x10,%esp
    1709:	e9 74 ff ff ff       	jmp    1682 <concreate+0x79>
        printf(1, "concreate create %s failed\n", file);
    170e:	83 ec 04             	sub    $0x4,%esp
    1711:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1714:	50                   	push   %eax
    1715:	68 28 43 00 00       	push   $0x4328
    171a:	6a 01                	push   $0x1
    171c:	e8 db 22 00 00       	call   39fc <printf>
        exit();
    1721:	e8 85 21 00 00       	call   38ab <exit>
      exit();
    1726:	e8 80 21 00 00       	call   38ab <exit>
  }

  memset(fa, 0, sizeof(fa));
    172b:	83 ec 04             	sub    $0x4,%esp
    172e:	6a 28                	push   $0x28
    1730:	6a 00                	push   $0x0
    1732:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1735:	50                   	push   %eax
    1736:	e8 4a 1f 00 00       	call   3685 <memset>
  fd = open(".", 0);
    173b:	83 c4 08             	add    $0x8,%esp
    173e:	6a 00                	push   $0x0
    1740:	68 32 45 00 00       	push   $0x4532
    1745:	e8 a1 21 00 00       	call   38eb <open>
    174a:	89 c3                	mov    %eax,%ebx
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    174c:	83 c4 10             	add    $0x10,%esp
  n = 0;
    174f:	be 00 00 00 00       	mov    $0x0,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1754:	83 ec 04             	sub    $0x4,%esp
    1757:	6a 10                	push   $0x10
    1759:	8d 45 ac             	lea    -0x54(%ebp),%eax
    175c:	50                   	push   %eax
    175d:	53                   	push   %ebx
    175e:	e8 60 21 00 00       	call   38c3 <read>
    1763:	83 c4 10             	add    $0x10,%esp
    1766:	85 c0                	test   %eax,%eax
    1768:	7e 60                	jle    17ca <concreate+0x1c1>
    if(de.inum == 0)
    176a:	66 83 7d ac 00       	cmpw   $0x0,-0x54(%ebp)
    176f:	74 e3                	je     1754 <concreate+0x14b>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1771:	80 7d ae 43          	cmpb   $0x43,-0x52(%ebp)
    1775:	75 dd                	jne    1754 <concreate+0x14b>
    1777:	80 7d b0 00          	cmpb   $0x0,-0x50(%ebp)
    177b:	75 d7                	jne    1754 <concreate+0x14b>
      i = de.name[1] - '0';
    177d:	0f be 45 af          	movsbl -0x51(%ebp),%eax
    1781:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1784:	83 f8 27             	cmp    $0x27,%eax
    1787:	77 11                	ja     179a <concreate+0x191>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    1789:	80 7c 05 bd 00       	cmpb   $0x0,-0x43(%ebp,%eax,1)
    178e:	75 22                	jne    17b2 <concreate+0x1a9>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1790:	c6 44 05 bd 01       	movb   $0x1,-0x43(%ebp,%eax,1)
      n++;
    1795:	83 c6 01             	add    $0x1,%esi
    1798:	eb ba                	jmp    1754 <concreate+0x14b>
        printf(1, "concreate weird file %s\n", de.name);
    179a:	83 ec 04             	sub    $0x4,%esp
    179d:	8d 45 ae             	lea    -0x52(%ebp),%eax
    17a0:	50                   	push   %eax
    17a1:	68 44 43 00 00       	push   $0x4344
    17a6:	6a 01                	push   $0x1
    17a8:	e8 4f 22 00 00       	call   39fc <printf>
        exit();
    17ad:	e8 f9 20 00 00       	call   38ab <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    17b2:	83 ec 04             	sub    $0x4,%esp
    17b5:	8d 45 ae             	lea    -0x52(%ebp),%eax
    17b8:	50                   	push   %eax
    17b9:	68 5d 43 00 00       	push   $0x435d
    17be:	6a 01                	push   $0x1
    17c0:	e8 37 22 00 00       	call   39fc <printf>
        exit();
    17c5:	e8 e1 20 00 00       	call   38ab <exit>
    }
  }
  close(fd);
    17ca:	83 ec 0c             	sub    $0xc,%esp
    17cd:	53                   	push   %ebx
    17ce:	e8 00 21 00 00       	call   38d3 <close>

  if(n != 40){
    17d3:	83 c4 10             	add    $0x10,%esp
    17d6:	83 fe 28             	cmp    $0x28,%esi
    17d9:	75 0a                	jne    17e5 <concreate+0x1dc>
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    17db:	bb 00 00 00 00       	mov    $0x0,%ebx
    17e0:	e9 86 00 00 00       	jmp    186b <concreate+0x262>
    printf(1, "concreate not enough files in directory listing\n");
    17e5:	83 ec 08             	sub    $0x8,%esp
    17e8:	68 c4 4e 00 00       	push   $0x4ec4
    17ed:	6a 01                	push   $0x1
    17ef:	e8 08 22 00 00       	call   39fc <printf>
    exit();
    17f4:	e8 b2 20 00 00       	call   38ab <exit>
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    17f9:	83 ec 08             	sub    $0x8,%esp
    17fc:	68 fd 4b 00 00       	push   $0x4bfd
    1801:	6a 01                	push   $0x1
    1803:	e8 f4 21 00 00       	call   39fc <printf>
      exit();
    1808:	e8 9e 20 00 00       	call   38ab <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    180d:	83 ec 08             	sub    $0x8,%esp
    1810:	6a 00                	push   $0x0
    1812:	8d 7d e5             	lea    -0x1b(%ebp),%edi
    1815:	57                   	push   %edi
    1816:	e8 d0 20 00 00       	call   38eb <open>
    181b:	89 04 24             	mov    %eax,(%esp)
    181e:	e8 b0 20 00 00       	call   38d3 <close>
      close(open(file, 0));
    1823:	83 c4 08             	add    $0x8,%esp
    1826:	6a 00                	push   $0x0
    1828:	57                   	push   %edi
    1829:	e8 bd 20 00 00       	call   38eb <open>
    182e:	89 04 24             	mov    %eax,(%esp)
    1831:	e8 9d 20 00 00       	call   38d3 <close>
      close(open(file, 0));
    1836:	83 c4 08             	add    $0x8,%esp
    1839:	6a 00                	push   $0x0
    183b:	57                   	push   %edi
    183c:	e8 aa 20 00 00       	call   38eb <open>
    1841:	89 04 24             	mov    %eax,(%esp)
    1844:	e8 8a 20 00 00       	call   38d3 <close>
      close(open(file, 0));
    1849:	83 c4 08             	add    $0x8,%esp
    184c:	6a 00                	push   $0x0
    184e:	57                   	push   %edi
    184f:	e8 97 20 00 00       	call   38eb <open>
    1854:	89 04 24             	mov    %eax,(%esp)
    1857:	e8 77 20 00 00       	call   38d3 <close>
    185c:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    185f:	85 f6                	test   %esi,%esi
    1861:	74 79                	je     18dc <concreate+0x2d3>
      exit();
    else
      wait();
    1863:	e8 4b 20 00 00       	call   38b3 <wait>
  for(i = 0; i < 40; i++){
    1868:	83 c3 01             	add    $0x1,%ebx
    186b:	83 fb 27             	cmp    $0x27,%ebx
    186e:	7f 71                	jg     18e1 <concreate+0x2d8>
    file[1] = '0' + i;
    1870:	8d 43 30             	lea    0x30(%ebx),%eax
    1873:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    1876:	e8 28 20 00 00       	call   38a3 <fork>
    187b:	89 c6                	mov    %eax,%esi
    if(pid < 0){
    187d:	85 c0                	test   %eax,%eax
    187f:	0f 88 74 ff ff ff    	js     17f9 <concreate+0x1f0>
    if(((i % 3) == 0 && pid == 0) ||
    1885:	ba 56 55 55 55       	mov    $0x55555556,%edx
    188a:	89 d8                	mov    %ebx,%eax
    188c:	f7 ea                	imul   %edx
    188e:	89 d8                	mov    %ebx,%eax
    1890:	c1 f8 1f             	sar    $0x1f,%eax
    1893:	29 c2                	sub    %eax,%edx
    1895:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1898:	89 da                	mov    %ebx,%edx
    189a:	29 c2                	sub    %eax,%edx
    189c:	89 d0                	mov    %edx,%eax
    189e:	09 f0                	or     %esi,%eax
    18a0:	0f 84 67 ff ff ff    	je     180d <concreate+0x204>
    18a6:	83 fa 01             	cmp    $0x1,%edx
    18a9:	75 08                	jne    18b3 <concreate+0x2aa>
       ((i % 3) == 1 && pid != 0)){
    18ab:	85 f6                	test   %esi,%esi
    18ad:	0f 85 5a ff ff ff    	jne    180d <concreate+0x204>
      unlink(file);
    18b3:	83 ec 0c             	sub    $0xc,%esp
    18b6:	8d 7d e5             	lea    -0x1b(%ebp),%edi
    18b9:	57                   	push   %edi
    18ba:	e8 3c 20 00 00       	call   38fb <unlink>
      unlink(file);
    18bf:	89 3c 24             	mov    %edi,(%esp)
    18c2:	e8 34 20 00 00       	call   38fb <unlink>
      unlink(file);
    18c7:	89 3c 24             	mov    %edi,(%esp)
    18ca:	e8 2c 20 00 00       	call   38fb <unlink>
      unlink(file);
    18cf:	89 3c 24             	mov    %edi,(%esp)
    18d2:	e8 24 20 00 00       	call   38fb <unlink>
    18d7:	83 c4 10             	add    $0x10,%esp
    18da:	eb 83                	jmp    185f <concreate+0x256>
      exit();
    18dc:	e8 ca 1f 00 00       	call   38ab <exit>
  }

  printf(1, "concreate ok\n");
    18e1:	83 ec 08             	sub    $0x8,%esp
    18e4:	68 7a 43 00 00       	push   $0x437a
    18e9:	6a 01                	push   $0x1
    18eb:	e8 0c 21 00 00       	call   39fc <printf>
}
    18f0:	83 c4 10             	add    $0x10,%esp
    18f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18f6:	5b                   	pop    %ebx
    18f7:	5e                   	pop    %esi
    18f8:	5f                   	pop    %edi
    18f9:	5d                   	pop    %ebp
    18fa:	c3                   	ret    

000018fb <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    18fb:	f3 0f 1e fb          	endbr32 
    18ff:	55                   	push   %ebp
    1900:	89 e5                	mov    %esp,%ebp
    1902:	57                   	push   %edi
    1903:	56                   	push   %esi
    1904:	53                   	push   %ebx
    1905:	83 ec 14             	sub    $0x14,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1908:	68 88 43 00 00       	push   $0x4388
    190d:	6a 01                	push   $0x1
    190f:	e8 e8 20 00 00       	call   39fc <printf>

  unlink("x");
    1914:	c7 04 24 15 46 00 00 	movl   $0x4615,(%esp)
    191b:	e8 db 1f 00 00       	call   38fb <unlink>
  pid = fork();
    1920:	e8 7e 1f 00 00       	call   38a3 <fork>
  if(pid < 0){
    1925:	83 c4 10             	add    $0x10,%esp
    1928:	85 c0                	test   %eax,%eax
    192a:	78 10                	js     193c <linkunlink+0x41>
    192c:	89 c7                	mov    %eax,%edi
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    192e:	74 20                	je     1950 <linkunlink+0x55>
    1930:	bb 01 00 00 00       	mov    $0x1,%ebx
    1935:	be 00 00 00 00       	mov    $0x0,%esi
    193a:	eb 4d                	jmp    1989 <linkunlink+0x8e>
    printf(1, "fork failed\n");
    193c:	83 ec 08             	sub    $0x8,%esp
    193f:	68 fd 4b 00 00       	push   $0x4bfd
    1944:	6a 01                	push   $0x1
    1946:	e8 b1 20 00 00       	call   39fc <printf>
    exit();
    194b:	e8 5b 1f 00 00       	call   38ab <exit>
  unsigned int x = (pid ? 1 : 97);
    1950:	bb 61 00 00 00       	mov    $0x61,%ebx
    1955:	eb de                	jmp    1935 <linkunlink+0x3a>
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    1957:	83 ec 08             	sub    $0x8,%esp
    195a:	68 02 02 00 00       	push   $0x202
    195f:	68 15 46 00 00       	push   $0x4615
    1964:	e8 82 1f 00 00       	call   38eb <open>
    1969:	89 04 24             	mov    %eax,(%esp)
    196c:	e8 62 1f 00 00       	call   38d3 <close>
    1971:	83 c4 10             	add    $0x10,%esp
    1974:	eb 10                	jmp    1986 <linkunlink+0x8b>
    } else if((x % 3) == 1){
      link("cat", "x");
    } else {
      unlink("x");
    1976:	83 ec 0c             	sub    $0xc,%esp
    1979:	68 15 46 00 00       	push   $0x4615
    197e:	e8 78 1f 00 00       	call   38fb <unlink>
    1983:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1986:	83 c6 01             	add    $0x1,%esi
    1989:	83 fe 63             	cmp    $0x63,%esi
    198c:	7f 40                	jg     19ce <linkunlink+0xd3>
    x = x * 1103515245 + 12345;
    198e:	69 db 6d 4e c6 41    	imul   $0x41c64e6d,%ebx,%ebx
    1994:	81 c3 39 30 00 00    	add    $0x3039,%ebx
    if((x % 3) == 0){
    199a:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    199f:	89 d8                	mov    %ebx,%eax
    19a1:	f7 e2                	mul    %edx
    19a3:	89 d0                	mov    %edx,%eax
    19a5:	d1 e8                	shr    %eax
    19a7:	83 e2 fe             	and    $0xfffffffe,%edx
    19aa:	01 c2                	add    %eax,%edx
    19ac:	89 d8                	mov    %ebx,%eax
    19ae:	29 d0                	sub    %edx,%eax
    19b0:	74 a5                	je     1957 <linkunlink+0x5c>
    } else if((x % 3) == 1){
    19b2:	83 f8 01             	cmp    $0x1,%eax
    19b5:	75 bf                	jne    1976 <linkunlink+0x7b>
      link("cat", "x");
    19b7:	83 ec 08             	sub    $0x8,%esp
    19ba:	68 15 46 00 00       	push   $0x4615
    19bf:	68 99 43 00 00       	push   $0x4399
    19c4:	e8 42 1f 00 00       	call   390b <link>
    19c9:	83 c4 10             	add    $0x10,%esp
    19cc:	eb b8                	jmp    1986 <linkunlink+0x8b>
    }
  }

  if(pid)
    19ce:	85 ff                	test   %edi,%edi
    19d0:	74 1c                	je     19ee <linkunlink+0xf3>
    wait();
    19d2:	e8 dc 1e 00 00       	call   38b3 <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    19d7:	83 ec 08             	sub    $0x8,%esp
    19da:	68 9d 43 00 00       	push   $0x439d
    19df:	6a 01                	push   $0x1
    19e1:	e8 16 20 00 00       	call   39fc <printf>
}
    19e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19e9:	5b                   	pop    %ebx
    19ea:	5e                   	pop    %esi
    19eb:	5f                   	pop    %edi
    19ec:	5d                   	pop    %ebp
    19ed:	c3                   	ret    
    exit();
    19ee:	e8 b8 1e 00 00       	call   38ab <exit>

000019f3 <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    19f3:	f3 0f 1e fb          	endbr32 
    19f7:	55                   	push   %ebp
    19f8:	89 e5                	mov    %esp,%ebp
    19fa:	53                   	push   %ebx
    19fb:	83 ec 1c             	sub    $0x1c,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    19fe:	68 ac 43 00 00       	push   $0x43ac
    1a03:	6a 01                	push   $0x1
    1a05:	e8 f2 1f 00 00       	call   39fc <printf>
  unlink("bd");
    1a0a:	c7 04 24 b9 43 00 00 	movl   $0x43b9,(%esp)
    1a11:	e8 e5 1e 00 00       	call   38fb <unlink>

  fd = open("bd", O_CREATE);
    1a16:	83 c4 08             	add    $0x8,%esp
    1a19:	68 00 02 00 00       	push   $0x200
    1a1e:	68 b9 43 00 00       	push   $0x43b9
    1a23:	e8 c3 1e 00 00       	call   38eb <open>
  if(fd < 0){
    1a28:	83 c4 10             	add    $0x10,%esp
    1a2b:	85 c0                	test   %eax,%eax
    1a2d:	78 65                	js     1a94 <bigdir+0xa1>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1a2f:	83 ec 0c             	sub    $0xc,%esp
    1a32:	50                   	push   %eax
    1a33:	e8 9b 1e 00 00       	call   38d3 <close>

  for(i = 0; i < 500; i++){
    1a38:	83 c4 10             	add    $0x10,%esp
    1a3b:	bb 00 00 00 00       	mov    $0x0,%ebx
    1a40:	81 fb f3 01 00 00    	cmp    $0x1f3,%ebx
    1a46:	7f 74                	jg     1abc <bigdir+0xc9>
    name[0] = 'x';
    1a48:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1a4c:	8d 43 3f             	lea    0x3f(%ebx),%eax
    1a4f:	85 db                	test   %ebx,%ebx
    1a51:	0f 49 c3             	cmovns %ebx,%eax
    1a54:	c1 f8 06             	sar    $0x6,%eax
    1a57:	83 c0 30             	add    $0x30,%eax
    1a5a:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1a5d:	89 da                	mov    %ebx,%edx
    1a5f:	c1 fa 1f             	sar    $0x1f,%edx
    1a62:	c1 ea 1a             	shr    $0x1a,%edx
    1a65:	8d 04 13             	lea    (%ebx,%edx,1),%eax
    1a68:	83 e0 3f             	and    $0x3f,%eax
    1a6b:	29 d0                	sub    %edx,%eax
    1a6d:	83 c0 30             	add    $0x30,%eax
    1a70:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1a73:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(link("bd", name) != 0){
    1a77:	83 ec 08             	sub    $0x8,%esp
    1a7a:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1a7d:	50                   	push   %eax
    1a7e:	68 b9 43 00 00       	push   $0x43b9
    1a83:	e8 83 1e 00 00       	call   390b <link>
    1a88:	83 c4 10             	add    $0x10,%esp
    1a8b:	85 c0                	test   %eax,%eax
    1a8d:	75 19                	jne    1aa8 <bigdir+0xb5>
  for(i = 0; i < 500; i++){
    1a8f:	83 c3 01             	add    $0x1,%ebx
    1a92:	eb ac                	jmp    1a40 <bigdir+0x4d>
    printf(1, "bigdir create failed\n");
    1a94:	83 ec 08             	sub    $0x8,%esp
    1a97:	68 bc 43 00 00       	push   $0x43bc
    1a9c:	6a 01                	push   $0x1
    1a9e:	e8 59 1f 00 00       	call   39fc <printf>
    exit();
    1aa3:	e8 03 1e 00 00       	call   38ab <exit>
      printf(1, "bigdir link failed\n");
    1aa8:	83 ec 08             	sub    $0x8,%esp
    1aab:	68 d2 43 00 00       	push   $0x43d2
    1ab0:	6a 01                	push   $0x1
    1ab2:	e8 45 1f 00 00       	call   39fc <printf>
      exit();
    1ab7:	e8 ef 1d 00 00       	call   38ab <exit>
    }
  }

  unlink("bd");
    1abc:	83 ec 0c             	sub    $0xc,%esp
    1abf:	68 b9 43 00 00       	push   $0x43b9
    1ac4:	e8 32 1e 00 00       	call   38fb <unlink>
  for(i = 0; i < 500; i++){
    1ac9:	83 c4 10             	add    $0x10,%esp
    1acc:	bb 00 00 00 00       	mov    $0x0,%ebx
    1ad1:	81 fb f3 01 00 00    	cmp    $0x1f3,%ebx
    1ad7:	7f 5b                	jg     1b34 <bigdir+0x141>
    name[0] = 'x';
    1ad9:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1add:	8d 43 3f             	lea    0x3f(%ebx),%eax
    1ae0:	85 db                	test   %ebx,%ebx
    1ae2:	0f 49 c3             	cmovns %ebx,%eax
    1ae5:	c1 f8 06             	sar    $0x6,%eax
    1ae8:	83 c0 30             	add    $0x30,%eax
    1aeb:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1aee:	89 da                	mov    %ebx,%edx
    1af0:	c1 fa 1f             	sar    $0x1f,%edx
    1af3:	c1 ea 1a             	shr    $0x1a,%edx
    1af6:	8d 04 13             	lea    (%ebx,%edx,1),%eax
    1af9:	83 e0 3f             	and    $0x3f,%eax
    1afc:	29 d0                	sub    %edx,%eax
    1afe:	83 c0 30             	add    $0x30,%eax
    1b01:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1b04:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(unlink(name) != 0){
    1b08:	83 ec 0c             	sub    $0xc,%esp
    1b0b:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1b0e:	50                   	push   %eax
    1b0f:	e8 e7 1d 00 00       	call   38fb <unlink>
    1b14:	83 c4 10             	add    $0x10,%esp
    1b17:	85 c0                	test   %eax,%eax
    1b19:	75 05                	jne    1b20 <bigdir+0x12d>
  for(i = 0; i < 500; i++){
    1b1b:	83 c3 01             	add    $0x1,%ebx
    1b1e:	eb b1                	jmp    1ad1 <bigdir+0xde>
      printf(1, "bigdir unlink failed");
    1b20:	83 ec 08             	sub    $0x8,%esp
    1b23:	68 e6 43 00 00       	push   $0x43e6
    1b28:	6a 01                	push   $0x1
    1b2a:	e8 cd 1e 00 00       	call   39fc <printf>
      exit();
    1b2f:	e8 77 1d 00 00       	call   38ab <exit>
    }
  }

  printf(1, "bigdir ok\n");
    1b34:	83 ec 08             	sub    $0x8,%esp
    1b37:	68 fb 43 00 00       	push   $0x43fb
    1b3c:	6a 01                	push   $0x1
    1b3e:	e8 b9 1e 00 00       	call   39fc <printf>
}
    1b43:	83 c4 10             	add    $0x10,%esp
    1b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1b49:	c9                   	leave  
    1b4a:	c3                   	ret    

00001b4b <subdir>:

void
subdir(void)
{
    1b4b:	f3 0f 1e fb          	endbr32 
    1b4f:	55                   	push   %ebp
    1b50:	89 e5                	mov    %esp,%ebp
    1b52:	53                   	push   %ebx
    1b53:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1b56:	68 06 44 00 00       	push   $0x4406
    1b5b:	6a 01                	push   $0x1
    1b5d:	e8 9a 1e 00 00       	call   39fc <printf>

  unlink("ff");
    1b62:	c7 04 24 8f 44 00 00 	movl   $0x448f,(%esp)
    1b69:	e8 8d 1d 00 00       	call   38fb <unlink>
  if(mkdir("dd") != 0){
    1b6e:	c7 04 24 2c 45 00 00 	movl   $0x452c,(%esp)
    1b75:	e8 99 1d 00 00       	call   3913 <mkdir>
    1b7a:	83 c4 10             	add    $0x10,%esp
    1b7d:	85 c0                	test   %eax,%eax
    1b7f:	0f 85 14 04 00 00    	jne    1f99 <subdir+0x44e>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1b85:	83 ec 08             	sub    $0x8,%esp
    1b88:	68 02 02 00 00       	push   $0x202
    1b8d:	68 65 44 00 00       	push   $0x4465
    1b92:	e8 54 1d 00 00       	call   38eb <open>
    1b97:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1b99:	83 c4 10             	add    $0x10,%esp
    1b9c:	85 c0                	test   %eax,%eax
    1b9e:	0f 88 09 04 00 00    	js     1fad <subdir+0x462>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1ba4:	83 ec 04             	sub    $0x4,%esp
    1ba7:	6a 02                	push   $0x2
    1ba9:	68 8f 44 00 00       	push   $0x448f
    1bae:	50                   	push   %eax
    1baf:	e8 17 1d 00 00       	call   38cb <write>
  close(fd);
    1bb4:	89 1c 24             	mov    %ebx,(%esp)
    1bb7:	e8 17 1d 00 00       	call   38d3 <close>

  if(unlink("dd") >= 0){
    1bbc:	c7 04 24 2c 45 00 00 	movl   $0x452c,(%esp)
    1bc3:	e8 33 1d 00 00       	call   38fb <unlink>
    1bc8:	83 c4 10             	add    $0x10,%esp
    1bcb:	85 c0                	test   %eax,%eax
    1bcd:	0f 89 ee 03 00 00    	jns    1fc1 <subdir+0x476>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1bd3:	83 ec 0c             	sub    $0xc,%esp
    1bd6:	68 40 44 00 00       	push   $0x4440
    1bdb:	e8 33 1d 00 00       	call   3913 <mkdir>
    1be0:	83 c4 10             	add    $0x10,%esp
    1be3:	85 c0                	test   %eax,%eax
    1be5:	0f 85 ea 03 00 00    	jne    1fd5 <subdir+0x48a>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1beb:	83 ec 08             	sub    $0x8,%esp
    1bee:	68 02 02 00 00       	push   $0x202
    1bf3:	68 62 44 00 00       	push   $0x4462
    1bf8:	e8 ee 1c 00 00       	call   38eb <open>
    1bfd:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1bff:	83 c4 10             	add    $0x10,%esp
    1c02:	85 c0                	test   %eax,%eax
    1c04:	0f 88 df 03 00 00    	js     1fe9 <subdir+0x49e>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1c0a:	83 ec 04             	sub    $0x4,%esp
    1c0d:	6a 02                	push   $0x2
    1c0f:	68 83 44 00 00       	push   $0x4483
    1c14:	50                   	push   %eax
    1c15:	e8 b1 1c 00 00       	call   38cb <write>
  close(fd);
    1c1a:	89 1c 24             	mov    %ebx,(%esp)
    1c1d:	e8 b1 1c 00 00       	call   38d3 <close>

  fd = open("dd/dd/../ff", 0);
    1c22:	83 c4 08             	add    $0x8,%esp
    1c25:	6a 00                	push   $0x0
    1c27:	68 86 44 00 00       	push   $0x4486
    1c2c:	e8 ba 1c 00 00       	call   38eb <open>
    1c31:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1c33:	83 c4 10             	add    $0x10,%esp
    1c36:	85 c0                	test   %eax,%eax
    1c38:	0f 88 bf 03 00 00    	js     1ffd <subdir+0x4b2>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1c3e:	83 ec 04             	sub    $0x4,%esp
    1c41:	68 00 20 00 00       	push   $0x2000
    1c46:	68 20 85 00 00       	push   $0x8520
    1c4b:	50                   	push   %eax
    1c4c:	e8 72 1c 00 00       	call   38c3 <read>
  if(cc != 2 || buf[0] != 'f'){
    1c51:	83 c4 10             	add    $0x10,%esp
    1c54:	83 f8 02             	cmp    $0x2,%eax
    1c57:	0f 85 b4 03 00 00    	jne    2011 <subdir+0x4c6>
    1c5d:	80 3d 20 85 00 00 66 	cmpb   $0x66,0x8520
    1c64:	0f 85 a7 03 00 00    	jne    2011 <subdir+0x4c6>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1c6a:	83 ec 0c             	sub    $0xc,%esp
    1c6d:	53                   	push   %ebx
    1c6e:	e8 60 1c 00 00       	call   38d3 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1c73:	83 c4 08             	add    $0x8,%esp
    1c76:	68 c6 44 00 00       	push   $0x44c6
    1c7b:	68 62 44 00 00       	push   $0x4462
    1c80:	e8 86 1c 00 00       	call   390b <link>
    1c85:	83 c4 10             	add    $0x10,%esp
    1c88:	85 c0                	test   %eax,%eax
    1c8a:	0f 85 95 03 00 00    	jne    2025 <subdir+0x4da>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1c90:	83 ec 0c             	sub    $0xc,%esp
    1c93:	68 62 44 00 00       	push   $0x4462
    1c98:	e8 5e 1c 00 00       	call   38fb <unlink>
    1c9d:	83 c4 10             	add    $0x10,%esp
    1ca0:	85 c0                	test   %eax,%eax
    1ca2:	0f 85 91 03 00 00    	jne    2039 <subdir+0x4ee>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1ca8:	83 ec 08             	sub    $0x8,%esp
    1cab:	6a 00                	push   $0x0
    1cad:	68 62 44 00 00       	push   $0x4462
    1cb2:	e8 34 1c 00 00       	call   38eb <open>
    1cb7:	83 c4 10             	add    $0x10,%esp
    1cba:	85 c0                	test   %eax,%eax
    1cbc:	0f 89 8b 03 00 00    	jns    204d <subdir+0x502>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1cc2:	83 ec 0c             	sub    $0xc,%esp
    1cc5:	68 2c 45 00 00       	push   $0x452c
    1cca:	e8 4c 1c 00 00       	call   391b <chdir>
    1ccf:	83 c4 10             	add    $0x10,%esp
    1cd2:	85 c0                	test   %eax,%eax
    1cd4:	0f 85 87 03 00 00    	jne    2061 <subdir+0x516>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1cda:	83 ec 0c             	sub    $0xc,%esp
    1cdd:	68 fa 44 00 00       	push   $0x44fa
    1ce2:	e8 34 1c 00 00       	call   391b <chdir>
    1ce7:	83 c4 10             	add    $0x10,%esp
    1cea:	85 c0                	test   %eax,%eax
    1cec:	0f 85 83 03 00 00    	jne    2075 <subdir+0x52a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1cf2:	83 ec 0c             	sub    $0xc,%esp
    1cf5:	68 20 45 00 00       	push   $0x4520
    1cfa:	e8 1c 1c 00 00       	call   391b <chdir>
    1cff:	83 c4 10             	add    $0x10,%esp
    1d02:	85 c0                	test   %eax,%eax
    1d04:	0f 85 7f 03 00 00    	jne    2089 <subdir+0x53e>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1d0a:	83 ec 0c             	sub    $0xc,%esp
    1d0d:	68 2f 45 00 00       	push   $0x452f
    1d12:	e8 04 1c 00 00       	call   391b <chdir>
    1d17:	83 c4 10             	add    $0x10,%esp
    1d1a:	85 c0                	test   %eax,%eax
    1d1c:	0f 85 7b 03 00 00    	jne    209d <subdir+0x552>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1d22:	83 ec 08             	sub    $0x8,%esp
    1d25:	6a 00                	push   $0x0
    1d27:	68 c6 44 00 00       	push   $0x44c6
    1d2c:	e8 ba 1b 00 00       	call   38eb <open>
    1d31:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d33:	83 c4 10             	add    $0x10,%esp
    1d36:	85 c0                	test   %eax,%eax
    1d38:	0f 88 73 03 00 00    	js     20b1 <subdir+0x566>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1d3e:	83 ec 04             	sub    $0x4,%esp
    1d41:	68 00 20 00 00       	push   $0x2000
    1d46:	68 20 85 00 00       	push   $0x8520
    1d4b:	50                   	push   %eax
    1d4c:	e8 72 1b 00 00       	call   38c3 <read>
    1d51:	83 c4 10             	add    $0x10,%esp
    1d54:	83 f8 02             	cmp    $0x2,%eax
    1d57:	0f 85 68 03 00 00    	jne    20c5 <subdir+0x57a>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1d5d:	83 ec 0c             	sub    $0xc,%esp
    1d60:	53                   	push   %ebx
    1d61:	e8 6d 1b 00 00       	call   38d3 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1d66:	83 c4 08             	add    $0x8,%esp
    1d69:	6a 00                	push   $0x0
    1d6b:	68 62 44 00 00       	push   $0x4462
    1d70:	e8 76 1b 00 00       	call   38eb <open>
    1d75:	83 c4 10             	add    $0x10,%esp
    1d78:	85 c0                	test   %eax,%eax
    1d7a:	0f 89 59 03 00 00    	jns    20d9 <subdir+0x58e>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1d80:	83 ec 08             	sub    $0x8,%esp
    1d83:	68 02 02 00 00       	push   $0x202
    1d88:	68 7a 45 00 00       	push   $0x457a
    1d8d:	e8 59 1b 00 00       	call   38eb <open>
    1d92:	83 c4 10             	add    $0x10,%esp
    1d95:	85 c0                	test   %eax,%eax
    1d97:	0f 89 50 03 00 00    	jns    20ed <subdir+0x5a2>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1d9d:	83 ec 08             	sub    $0x8,%esp
    1da0:	68 02 02 00 00       	push   $0x202
    1da5:	68 9f 45 00 00       	push   $0x459f
    1daa:	e8 3c 1b 00 00       	call   38eb <open>
    1daf:	83 c4 10             	add    $0x10,%esp
    1db2:	85 c0                	test   %eax,%eax
    1db4:	0f 89 47 03 00 00    	jns    2101 <subdir+0x5b6>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1dba:	83 ec 08             	sub    $0x8,%esp
    1dbd:	68 00 02 00 00       	push   $0x200
    1dc2:	68 2c 45 00 00       	push   $0x452c
    1dc7:	e8 1f 1b 00 00       	call   38eb <open>
    1dcc:	83 c4 10             	add    $0x10,%esp
    1dcf:	85 c0                	test   %eax,%eax
    1dd1:	0f 89 3e 03 00 00    	jns    2115 <subdir+0x5ca>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1dd7:	83 ec 08             	sub    $0x8,%esp
    1dda:	6a 02                	push   $0x2
    1ddc:	68 2c 45 00 00       	push   $0x452c
    1de1:	e8 05 1b 00 00       	call   38eb <open>
    1de6:	83 c4 10             	add    $0x10,%esp
    1de9:	85 c0                	test   %eax,%eax
    1deb:	0f 89 38 03 00 00    	jns    2129 <subdir+0x5de>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1df1:	83 ec 08             	sub    $0x8,%esp
    1df4:	6a 01                	push   $0x1
    1df6:	68 2c 45 00 00       	push   $0x452c
    1dfb:	e8 eb 1a 00 00       	call   38eb <open>
    1e00:	83 c4 10             	add    $0x10,%esp
    1e03:	85 c0                	test   %eax,%eax
    1e05:	0f 89 32 03 00 00    	jns    213d <subdir+0x5f2>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1e0b:	83 ec 08             	sub    $0x8,%esp
    1e0e:	68 0e 46 00 00       	push   $0x460e
    1e13:	68 7a 45 00 00       	push   $0x457a
    1e18:	e8 ee 1a 00 00       	call   390b <link>
    1e1d:	83 c4 10             	add    $0x10,%esp
    1e20:	85 c0                	test   %eax,%eax
    1e22:	0f 84 29 03 00 00    	je     2151 <subdir+0x606>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1e28:	83 ec 08             	sub    $0x8,%esp
    1e2b:	68 0e 46 00 00       	push   $0x460e
    1e30:	68 9f 45 00 00       	push   $0x459f
    1e35:	e8 d1 1a 00 00       	call   390b <link>
    1e3a:	83 c4 10             	add    $0x10,%esp
    1e3d:	85 c0                	test   %eax,%eax
    1e3f:	0f 84 20 03 00 00    	je     2165 <subdir+0x61a>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1e45:	83 ec 08             	sub    $0x8,%esp
    1e48:	68 c6 44 00 00       	push   $0x44c6
    1e4d:	68 65 44 00 00       	push   $0x4465
    1e52:	e8 b4 1a 00 00       	call   390b <link>
    1e57:	83 c4 10             	add    $0x10,%esp
    1e5a:	85 c0                	test   %eax,%eax
    1e5c:	0f 84 17 03 00 00    	je     2179 <subdir+0x62e>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    1e62:	83 ec 0c             	sub    $0xc,%esp
    1e65:	68 7a 45 00 00       	push   $0x457a
    1e6a:	e8 a4 1a 00 00       	call   3913 <mkdir>
    1e6f:	83 c4 10             	add    $0x10,%esp
    1e72:	85 c0                	test   %eax,%eax
    1e74:	0f 84 13 03 00 00    	je     218d <subdir+0x642>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    1e7a:	83 ec 0c             	sub    $0xc,%esp
    1e7d:	68 9f 45 00 00       	push   $0x459f
    1e82:	e8 8c 1a 00 00       	call   3913 <mkdir>
    1e87:	83 c4 10             	add    $0x10,%esp
    1e8a:	85 c0                	test   %eax,%eax
    1e8c:	0f 84 0f 03 00 00    	je     21a1 <subdir+0x656>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    1e92:	83 ec 0c             	sub    $0xc,%esp
    1e95:	68 c6 44 00 00       	push   $0x44c6
    1e9a:	e8 74 1a 00 00       	call   3913 <mkdir>
    1e9f:	83 c4 10             	add    $0x10,%esp
    1ea2:	85 c0                	test   %eax,%eax
    1ea4:	0f 84 0b 03 00 00    	je     21b5 <subdir+0x66a>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    1eaa:	83 ec 0c             	sub    $0xc,%esp
    1ead:	68 9f 45 00 00       	push   $0x459f
    1eb2:	e8 44 1a 00 00       	call   38fb <unlink>
    1eb7:	83 c4 10             	add    $0x10,%esp
    1eba:	85 c0                	test   %eax,%eax
    1ebc:	0f 84 07 03 00 00    	je     21c9 <subdir+0x67e>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    1ec2:	83 ec 0c             	sub    $0xc,%esp
    1ec5:	68 7a 45 00 00       	push   $0x457a
    1eca:	e8 2c 1a 00 00       	call   38fb <unlink>
    1ecf:	83 c4 10             	add    $0x10,%esp
    1ed2:	85 c0                	test   %eax,%eax
    1ed4:	0f 84 03 03 00 00    	je     21dd <subdir+0x692>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    1eda:	83 ec 0c             	sub    $0xc,%esp
    1edd:	68 65 44 00 00       	push   $0x4465
    1ee2:	e8 34 1a 00 00       	call   391b <chdir>
    1ee7:	83 c4 10             	add    $0x10,%esp
    1eea:	85 c0                	test   %eax,%eax
    1eec:	0f 84 ff 02 00 00    	je     21f1 <subdir+0x6a6>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    1ef2:	83 ec 0c             	sub    $0xc,%esp
    1ef5:	68 11 46 00 00       	push   $0x4611
    1efa:	e8 1c 1a 00 00       	call   391b <chdir>
    1eff:	83 c4 10             	add    $0x10,%esp
    1f02:	85 c0                	test   %eax,%eax
    1f04:	0f 84 fb 02 00 00    	je     2205 <subdir+0x6ba>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    1f0a:	83 ec 0c             	sub    $0xc,%esp
    1f0d:	68 c6 44 00 00       	push   $0x44c6
    1f12:	e8 e4 19 00 00       	call   38fb <unlink>
    1f17:	83 c4 10             	add    $0x10,%esp
    1f1a:	85 c0                	test   %eax,%eax
    1f1c:	0f 85 f7 02 00 00    	jne    2219 <subdir+0x6ce>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    1f22:	83 ec 0c             	sub    $0xc,%esp
    1f25:	68 65 44 00 00       	push   $0x4465
    1f2a:	e8 cc 19 00 00       	call   38fb <unlink>
    1f2f:	83 c4 10             	add    $0x10,%esp
    1f32:	85 c0                	test   %eax,%eax
    1f34:	0f 85 f3 02 00 00    	jne    222d <subdir+0x6e2>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    1f3a:	83 ec 0c             	sub    $0xc,%esp
    1f3d:	68 2c 45 00 00       	push   $0x452c
    1f42:	e8 b4 19 00 00       	call   38fb <unlink>
    1f47:	83 c4 10             	add    $0x10,%esp
    1f4a:	85 c0                	test   %eax,%eax
    1f4c:	0f 84 ef 02 00 00    	je     2241 <subdir+0x6f6>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    1f52:	83 ec 0c             	sub    $0xc,%esp
    1f55:	68 41 44 00 00       	push   $0x4441
    1f5a:	e8 9c 19 00 00       	call   38fb <unlink>
    1f5f:	83 c4 10             	add    $0x10,%esp
    1f62:	85 c0                	test   %eax,%eax
    1f64:	0f 88 eb 02 00 00    	js     2255 <subdir+0x70a>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    1f6a:	83 ec 0c             	sub    $0xc,%esp
    1f6d:	68 2c 45 00 00       	push   $0x452c
    1f72:	e8 84 19 00 00       	call   38fb <unlink>
    1f77:	83 c4 10             	add    $0x10,%esp
    1f7a:	85 c0                	test   %eax,%eax
    1f7c:	0f 88 e7 02 00 00    	js     2269 <subdir+0x71e>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    1f82:	83 ec 08             	sub    $0x8,%esp
    1f85:	68 0e 47 00 00       	push   $0x470e
    1f8a:	6a 01                	push   $0x1
    1f8c:	e8 6b 1a 00 00       	call   39fc <printf>
}
    1f91:	83 c4 10             	add    $0x10,%esp
    1f94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f97:	c9                   	leave  
    1f98:	c3                   	ret    
    printf(1, "subdir mkdir dd failed\n");
    1f99:	83 ec 08             	sub    $0x8,%esp
    1f9c:	68 13 44 00 00       	push   $0x4413
    1fa1:	6a 01                	push   $0x1
    1fa3:	e8 54 1a 00 00       	call   39fc <printf>
    exit();
    1fa8:	e8 fe 18 00 00       	call   38ab <exit>
    printf(1, "create dd/ff failed\n");
    1fad:	83 ec 08             	sub    $0x8,%esp
    1fb0:	68 2b 44 00 00       	push   $0x442b
    1fb5:	6a 01                	push   $0x1
    1fb7:	e8 40 1a 00 00       	call   39fc <printf>
    exit();
    1fbc:	e8 ea 18 00 00       	call   38ab <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1fc1:	83 ec 08             	sub    $0x8,%esp
    1fc4:	68 f8 4e 00 00       	push   $0x4ef8
    1fc9:	6a 01                	push   $0x1
    1fcb:	e8 2c 1a 00 00       	call   39fc <printf>
    exit();
    1fd0:	e8 d6 18 00 00       	call   38ab <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    1fd5:	83 ec 08             	sub    $0x8,%esp
    1fd8:	68 47 44 00 00       	push   $0x4447
    1fdd:	6a 01                	push   $0x1
    1fdf:	e8 18 1a 00 00       	call   39fc <printf>
    exit();
    1fe4:	e8 c2 18 00 00       	call   38ab <exit>
    printf(1, "create dd/dd/ff failed\n");
    1fe9:	83 ec 08             	sub    $0x8,%esp
    1fec:	68 6b 44 00 00       	push   $0x446b
    1ff1:	6a 01                	push   $0x1
    1ff3:	e8 04 1a 00 00       	call   39fc <printf>
    exit();
    1ff8:	e8 ae 18 00 00       	call   38ab <exit>
    printf(1, "open dd/dd/../ff failed\n");
    1ffd:	83 ec 08             	sub    $0x8,%esp
    2000:	68 92 44 00 00       	push   $0x4492
    2005:	6a 01                	push   $0x1
    2007:	e8 f0 19 00 00       	call   39fc <printf>
    exit();
    200c:	e8 9a 18 00 00       	call   38ab <exit>
    printf(1, "dd/dd/../ff wrong content\n");
    2011:	83 ec 08             	sub    $0x8,%esp
    2014:	68 ab 44 00 00       	push   $0x44ab
    2019:	6a 01                	push   $0x1
    201b:	e8 dc 19 00 00       	call   39fc <printf>
    exit();
    2020:	e8 86 18 00 00       	call   38ab <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2025:	83 ec 08             	sub    $0x8,%esp
    2028:	68 20 4f 00 00       	push   $0x4f20
    202d:	6a 01                	push   $0x1
    202f:	e8 c8 19 00 00       	call   39fc <printf>
    exit();
    2034:	e8 72 18 00 00       	call   38ab <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    2039:	83 ec 08             	sub    $0x8,%esp
    203c:	68 d1 44 00 00       	push   $0x44d1
    2041:	6a 01                	push   $0x1
    2043:	e8 b4 19 00 00       	call   39fc <printf>
    exit();
    2048:	e8 5e 18 00 00       	call   38ab <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    204d:	83 ec 08             	sub    $0x8,%esp
    2050:	68 44 4f 00 00       	push   $0x4f44
    2055:	6a 01                	push   $0x1
    2057:	e8 a0 19 00 00       	call   39fc <printf>
    exit();
    205c:	e8 4a 18 00 00       	call   38ab <exit>
    printf(1, "chdir dd failed\n");
    2061:	83 ec 08             	sub    $0x8,%esp
    2064:	68 e9 44 00 00       	push   $0x44e9
    2069:	6a 01                	push   $0x1
    206b:	e8 8c 19 00 00       	call   39fc <printf>
    exit();
    2070:	e8 36 18 00 00       	call   38ab <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2075:	83 ec 08             	sub    $0x8,%esp
    2078:	68 06 45 00 00       	push   $0x4506
    207d:	6a 01                	push   $0x1
    207f:	e8 78 19 00 00       	call   39fc <printf>
    exit();
    2084:	e8 22 18 00 00       	call   38ab <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2089:	83 ec 08             	sub    $0x8,%esp
    208c:	68 06 45 00 00       	push   $0x4506
    2091:	6a 01                	push   $0x1
    2093:	e8 64 19 00 00       	call   39fc <printf>
    exit();
    2098:	e8 0e 18 00 00       	call   38ab <exit>
    printf(1, "chdir ./.. failed\n");
    209d:	83 ec 08             	sub    $0x8,%esp
    20a0:	68 34 45 00 00       	push   $0x4534
    20a5:	6a 01                	push   $0x1
    20a7:	e8 50 19 00 00       	call   39fc <printf>
    exit();
    20ac:	e8 fa 17 00 00       	call   38ab <exit>
    printf(1, "open dd/dd/ffff failed\n");
    20b1:	83 ec 08             	sub    $0x8,%esp
    20b4:	68 47 45 00 00       	push   $0x4547
    20b9:	6a 01                	push   $0x1
    20bb:	e8 3c 19 00 00       	call   39fc <printf>
    exit();
    20c0:	e8 e6 17 00 00       	call   38ab <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    20c5:	83 ec 08             	sub    $0x8,%esp
    20c8:	68 5f 45 00 00       	push   $0x455f
    20cd:	6a 01                	push   $0x1
    20cf:	e8 28 19 00 00       	call   39fc <printf>
    exit();
    20d4:	e8 d2 17 00 00       	call   38ab <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    20d9:	83 ec 08             	sub    $0x8,%esp
    20dc:	68 68 4f 00 00       	push   $0x4f68
    20e1:	6a 01                	push   $0x1
    20e3:	e8 14 19 00 00       	call   39fc <printf>
    exit();
    20e8:	e8 be 17 00 00       	call   38ab <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    20ed:	83 ec 08             	sub    $0x8,%esp
    20f0:	68 83 45 00 00       	push   $0x4583
    20f5:	6a 01                	push   $0x1
    20f7:	e8 00 19 00 00       	call   39fc <printf>
    exit();
    20fc:	e8 aa 17 00 00       	call   38ab <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    2101:	83 ec 08             	sub    $0x8,%esp
    2104:	68 a8 45 00 00       	push   $0x45a8
    2109:	6a 01                	push   $0x1
    210b:	e8 ec 18 00 00       	call   39fc <printf>
    exit();
    2110:	e8 96 17 00 00       	call   38ab <exit>
    printf(1, "create dd succeeded!\n");
    2115:	83 ec 08             	sub    $0x8,%esp
    2118:	68 c4 45 00 00       	push   $0x45c4
    211d:	6a 01                	push   $0x1
    211f:	e8 d8 18 00 00       	call   39fc <printf>
    exit();
    2124:	e8 82 17 00 00       	call   38ab <exit>
    printf(1, "open dd rdwr succeeded!\n");
    2129:	83 ec 08             	sub    $0x8,%esp
    212c:	68 da 45 00 00       	push   $0x45da
    2131:	6a 01                	push   $0x1
    2133:	e8 c4 18 00 00       	call   39fc <printf>
    exit();
    2138:	e8 6e 17 00 00       	call   38ab <exit>
    printf(1, "open dd wronly succeeded!\n");
    213d:	83 ec 08             	sub    $0x8,%esp
    2140:	68 f3 45 00 00       	push   $0x45f3
    2145:	6a 01                	push   $0x1
    2147:	e8 b0 18 00 00       	call   39fc <printf>
    exit();
    214c:	e8 5a 17 00 00       	call   38ab <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2151:	83 ec 08             	sub    $0x8,%esp
    2154:	68 90 4f 00 00       	push   $0x4f90
    2159:	6a 01                	push   $0x1
    215b:	e8 9c 18 00 00       	call   39fc <printf>
    exit();
    2160:	e8 46 17 00 00       	call   38ab <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2165:	83 ec 08             	sub    $0x8,%esp
    2168:	68 b4 4f 00 00       	push   $0x4fb4
    216d:	6a 01                	push   $0x1
    216f:	e8 88 18 00 00       	call   39fc <printf>
    exit();
    2174:	e8 32 17 00 00       	call   38ab <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2179:	83 ec 08             	sub    $0x8,%esp
    217c:	68 d8 4f 00 00       	push   $0x4fd8
    2181:	6a 01                	push   $0x1
    2183:	e8 74 18 00 00       	call   39fc <printf>
    exit();
    2188:	e8 1e 17 00 00       	call   38ab <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    218d:	83 ec 08             	sub    $0x8,%esp
    2190:	68 17 46 00 00       	push   $0x4617
    2195:	6a 01                	push   $0x1
    2197:	e8 60 18 00 00       	call   39fc <printf>
    exit();
    219c:	e8 0a 17 00 00       	call   38ab <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    21a1:	83 ec 08             	sub    $0x8,%esp
    21a4:	68 32 46 00 00       	push   $0x4632
    21a9:	6a 01                	push   $0x1
    21ab:	e8 4c 18 00 00       	call   39fc <printf>
    exit();
    21b0:	e8 f6 16 00 00       	call   38ab <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    21b5:	83 ec 08             	sub    $0x8,%esp
    21b8:	68 4d 46 00 00       	push   $0x464d
    21bd:	6a 01                	push   $0x1
    21bf:	e8 38 18 00 00       	call   39fc <printf>
    exit();
    21c4:	e8 e2 16 00 00       	call   38ab <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    21c9:	83 ec 08             	sub    $0x8,%esp
    21cc:	68 6a 46 00 00       	push   $0x466a
    21d1:	6a 01                	push   $0x1
    21d3:	e8 24 18 00 00       	call   39fc <printf>
    exit();
    21d8:	e8 ce 16 00 00       	call   38ab <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    21dd:	83 ec 08             	sub    $0x8,%esp
    21e0:	68 86 46 00 00       	push   $0x4686
    21e5:	6a 01                	push   $0x1
    21e7:	e8 10 18 00 00       	call   39fc <printf>
    exit();
    21ec:	e8 ba 16 00 00       	call   38ab <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    21f1:	83 ec 08             	sub    $0x8,%esp
    21f4:	68 a2 46 00 00       	push   $0x46a2
    21f9:	6a 01                	push   $0x1
    21fb:	e8 fc 17 00 00       	call   39fc <printf>
    exit();
    2200:	e8 a6 16 00 00       	call   38ab <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2205:	83 ec 08             	sub    $0x8,%esp
    2208:	68 ba 46 00 00       	push   $0x46ba
    220d:	6a 01                	push   $0x1
    220f:	e8 e8 17 00 00       	call   39fc <printf>
    exit();
    2214:	e8 92 16 00 00       	call   38ab <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    2219:	83 ec 08             	sub    $0x8,%esp
    221c:	68 d1 44 00 00       	push   $0x44d1
    2221:	6a 01                	push   $0x1
    2223:	e8 d4 17 00 00       	call   39fc <printf>
    exit();
    2228:	e8 7e 16 00 00       	call   38ab <exit>
    printf(1, "unlink dd/ff failed\n");
    222d:	83 ec 08             	sub    $0x8,%esp
    2230:	68 d2 46 00 00       	push   $0x46d2
    2235:	6a 01                	push   $0x1
    2237:	e8 c0 17 00 00       	call   39fc <printf>
    exit();
    223c:	e8 6a 16 00 00       	call   38ab <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2241:	83 ec 08             	sub    $0x8,%esp
    2244:	68 fc 4f 00 00       	push   $0x4ffc
    2249:	6a 01                	push   $0x1
    224b:	e8 ac 17 00 00       	call   39fc <printf>
    exit();
    2250:	e8 56 16 00 00       	call   38ab <exit>
    printf(1, "unlink dd/dd failed\n");
    2255:	83 ec 08             	sub    $0x8,%esp
    2258:	68 e7 46 00 00       	push   $0x46e7
    225d:	6a 01                	push   $0x1
    225f:	e8 98 17 00 00       	call   39fc <printf>
    exit();
    2264:	e8 42 16 00 00       	call   38ab <exit>
    printf(1, "unlink dd failed\n");
    2269:	83 ec 08             	sub    $0x8,%esp
    226c:	68 fc 46 00 00       	push   $0x46fc
    2271:	6a 01                	push   $0x1
    2273:	e8 84 17 00 00       	call   39fc <printf>
    exit();
    2278:	e8 2e 16 00 00       	call   38ab <exit>

0000227d <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    227d:	f3 0f 1e fb          	endbr32 
    2281:	55                   	push   %ebp
    2282:	89 e5                	mov    %esp,%ebp
    2284:	57                   	push   %edi
    2285:	56                   	push   %esi
    2286:	53                   	push   %ebx
    2287:	83 ec 14             	sub    $0x14,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    228a:	68 19 47 00 00       	push   $0x4719
    228f:	6a 01                	push   $0x1
    2291:	e8 66 17 00 00       	call   39fc <printf>

  unlink("bigwrite");
    2296:	c7 04 24 28 47 00 00 	movl   $0x4728,(%esp)
    229d:	e8 59 16 00 00       	call   38fb <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    22a2:	83 c4 10             	add    $0x10,%esp
    22a5:	be f3 01 00 00       	mov    $0x1f3,%esi
    22aa:	eb 45                	jmp    22f1 <bigwrite+0x74>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    22ac:	83 ec 08             	sub    $0x8,%esp
    22af:	68 31 47 00 00       	push   $0x4731
    22b4:	6a 01                	push   $0x1
    22b6:	e8 41 17 00 00       	call   39fc <printf>
      exit();
    22bb:	e8 eb 15 00 00       	call   38ab <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    22c0:	50                   	push   %eax
    22c1:	56                   	push   %esi
    22c2:	68 49 47 00 00       	push   $0x4749
    22c7:	6a 01                	push   $0x1
    22c9:	e8 2e 17 00 00       	call   39fc <printf>
        exit();
    22ce:	e8 d8 15 00 00       	call   38ab <exit>
      }
    }
    close(fd);
    22d3:	83 ec 0c             	sub    $0xc,%esp
    22d6:	57                   	push   %edi
    22d7:	e8 f7 15 00 00       	call   38d3 <close>
    unlink("bigwrite");
    22dc:	c7 04 24 28 47 00 00 	movl   $0x4728,(%esp)
    22e3:	e8 13 16 00 00       	call   38fb <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    22e8:	81 c6 d7 01 00 00    	add    $0x1d7,%esi
    22ee:	83 c4 10             	add    $0x10,%esp
    22f1:	81 fe ff 17 00 00    	cmp    $0x17ff,%esi
    22f7:	7f 40                	jg     2339 <bigwrite+0xbc>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    22f9:	83 ec 08             	sub    $0x8,%esp
    22fc:	68 02 02 00 00       	push   $0x202
    2301:	68 28 47 00 00       	push   $0x4728
    2306:	e8 e0 15 00 00       	call   38eb <open>
    230b:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    230d:	83 c4 10             	add    $0x10,%esp
    2310:	85 c0                	test   %eax,%eax
    2312:	78 98                	js     22ac <bigwrite+0x2f>
    for(i = 0; i < 2; i++){
    2314:	bb 00 00 00 00       	mov    $0x0,%ebx
    2319:	83 fb 01             	cmp    $0x1,%ebx
    231c:	7f b5                	jg     22d3 <bigwrite+0x56>
      int cc = write(fd, buf, sz);
    231e:	83 ec 04             	sub    $0x4,%esp
    2321:	56                   	push   %esi
    2322:	68 20 85 00 00       	push   $0x8520
    2327:	57                   	push   %edi
    2328:	e8 9e 15 00 00       	call   38cb <write>
      if(cc != sz){
    232d:	83 c4 10             	add    $0x10,%esp
    2330:	39 c6                	cmp    %eax,%esi
    2332:	75 8c                	jne    22c0 <bigwrite+0x43>
    for(i = 0; i < 2; i++){
    2334:	83 c3 01             	add    $0x1,%ebx
    2337:	eb e0                	jmp    2319 <bigwrite+0x9c>
  }

  printf(1, "bigwrite ok\n");
    2339:	83 ec 08             	sub    $0x8,%esp
    233c:	68 5b 47 00 00       	push   $0x475b
    2341:	6a 01                	push   $0x1
    2343:	e8 b4 16 00 00       	call   39fc <printf>
}
    2348:	83 c4 10             	add    $0x10,%esp
    234b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    234e:	5b                   	pop    %ebx
    234f:	5e                   	pop    %esi
    2350:	5f                   	pop    %edi
    2351:	5d                   	pop    %ebp
    2352:	c3                   	ret    

00002353 <bigfile>:

void
bigfile(void)
{
    2353:	f3 0f 1e fb          	endbr32 
    2357:	55                   	push   %ebp
    2358:	89 e5                	mov    %esp,%ebp
    235a:	57                   	push   %edi
    235b:	56                   	push   %esi
    235c:	53                   	push   %ebx
    235d:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2360:	68 68 47 00 00       	push   $0x4768
    2365:	6a 01                	push   $0x1
    2367:	e8 90 16 00 00       	call   39fc <printf>

  unlink("bigfile");
    236c:	c7 04 24 84 47 00 00 	movl   $0x4784,(%esp)
    2373:	e8 83 15 00 00       	call   38fb <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2378:	83 c4 08             	add    $0x8,%esp
    237b:	68 02 02 00 00       	push   $0x202
    2380:	68 84 47 00 00       	push   $0x4784
    2385:	e8 61 15 00 00       	call   38eb <open>
  if(fd < 0){
    238a:	83 c4 10             	add    $0x10,%esp
    238d:	85 c0                	test   %eax,%eax
    238f:	78 41                	js     23d2 <bigfile+0x7f>
    2391:	89 c6                	mov    %eax,%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    2393:	bb 00 00 00 00       	mov    $0x0,%ebx
    2398:	83 fb 13             	cmp    $0x13,%ebx
    239b:	7f 5d                	jg     23fa <bigfile+0xa7>
    memset(buf, i, 600);
    239d:	83 ec 04             	sub    $0x4,%esp
    23a0:	68 58 02 00 00       	push   $0x258
    23a5:	53                   	push   %ebx
    23a6:	68 20 85 00 00       	push   $0x8520
    23ab:	e8 d5 12 00 00       	call   3685 <memset>
    if(write(fd, buf, 600) != 600){
    23b0:	83 c4 0c             	add    $0xc,%esp
    23b3:	68 58 02 00 00       	push   $0x258
    23b8:	68 20 85 00 00       	push   $0x8520
    23bd:	56                   	push   %esi
    23be:	e8 08 15 00 00       	call   38cb <write>
    23c3:	83 c4 10             	add    $0x10,%esp
    23c6:	3d 58 02 00 00       	cmp    $0x258,%eax
    23cb:	75 19                	jne    23e6 <bigfile+0x93>
  for(i = 0; i < 20; i++){
    23cd:	83 c3 01             	add    $0x1,%ebx
    23d0:	eb c6                	jmp    2398 <bigfile+0x45>
    printf(1, "cannot create bigfile");
    23d2:	83 ec 08             	sub    $0x8,%esp
    23d5:	68 76 47 00 00       	push   $0x4776
    23da:	6a 01                	push   $0x1
    23dc:	e8 1b 16 00 00       	call   39fc <printf>
    exit();
    23e1:	e8 c5 14 00 00       	call   38ab <exit>
      printf(1, "write bigfile failed\n");
    23e6:	83 ec 08             	sub    $0x8,%esp
    23e9:	68 8c 47 00 00       	push   $0x478c
    23ee:	6a 01                	push   $0x1
    23f0:	e8 07 16 00 00       	call   39fc <printf>
      exit();
    23f5:	e8 b1 14 00 00       	call   38ab <exit>
    }
  }
  close(fd);
    23fa:	83 ec 0c             	sub    $0xc,%esp
    23fd:	56                   	push   %esi
    23fe:	e8 d0 14 00 00       	call   38d3 <close>

  fd = open("bigfile", 0);
    2403:	83 c4 08             	add    $0x8,%esp
    2406:	6a 00                	push   $0x0
    2408:	68 84 47 00 00       	push   $0x4784
    240d:	e8 d9 14 00 00       	call   38eb <open>
    2412:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    2414:	83 c4 10             	add    $0x10,%esp
    2417:	85 c0                	test   %eax,%eax
    2419:	78 53                	js     246e <bigfile+0x11b>
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
    241b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; ; i++){
    2420:	bb 00 00 00 00       	mov    $0x0,%ebx
    cc = read(fd, buf, 300);
    2425:	83 ec 04             	sub    $0x4,%esp
    2428:	68 2c 01 00 00       	push   $0x12c
    242d:	68 20 85 00 00       	push   $0x8520
    2432:	57                   	push   %edi
    2433:	e8 8b 14 00 00       	call   38c3 <read>
    if(cc < 0){
    2438:	83 c4 10             	add    $0x10,%esp
    243b:	85 c0                	test   %eax,%eax
    243d:	78 43                	js     2482 <bigfile+0x12f>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    243f:	74 7d                	je     24be <bigfile+0x16b>
      break;
    if(cc != 300){
    2441:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2446:	75 4e                	jne    2496 <bigfile+0x143>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2448:	0f be 0d 20 85 00 00 	movsbl 0x8520,%ecx
    244f:	89 da                	mov    %ebx,%edx
    2451:	c1 ea 1f             	shr    $0x1f,%edx
    2454:	01 da                	add    %ebx,%edx
    2456:	d1 fa                	sar    %edx
    2458:	39 d1                	cmp    %edx,%ecx
    245a:	75 4e                	jne    24aa <bigfile+0x157>
    245c:	0f be 0d 4b 86 00 00 	movsbl 0x864b,%ecx
    2463:	39 ca                	cmp    %ecx,%edx
    2465:	75 43                	jne    24aa <bigfile+0x157>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    2467:	01 c6                	add    %eax,%esi
  for(i = 0; ; i++){
    2469:	83 c3 01             	add    $0x1,%ebx
    cc = read(fd, buf, 300);
    246c:	eb b7                	jmp    2425 <bigfile+0xd2>
    printf(1, "cannot open bigfile\n");
    246e:	83 ec 08             	sub    $0x8,%esp
    2471:	68 a2 47 00 00       	push   $0x47a2
    2476:	6a 01                	push   $0x1
    2478:	e8 7f 15 00 00       	call   39fc <printf>
    exit();
    247d:	e8 29 14 00 00       	call   38ab <exit>
      printf(1, "read bigfile failed\n");
    2482:	83 ec 08             	sub    $0x8,%esp
    2485:	68 b7 47 00 00       	push   $0x47b7
    248a:	6a 01                	push   $0x1
    248c:	e8 6b 15 00 00       	call   39fc <printf>
      exit();
    2491:	e8 15 14 00 00       	call   38ab <exit>
      printf(1, "short read bigfile\n");
    2496:	83 ec 08             	sub    $0x8,%esp
    2499:	68 cc 47 00 00       	push   $0x47cc
    249e:	6a 01                	push   $0x1
    24a0:	e8 57 15 00 00       	call   39fc <printf>
      exit();
    24a5:	e8 01 14 00 00       	call   38ab <exit>
      printf(1, "read bigfile wrong data\n");
    24aa:	83 ec 08             	sub    $0x8,%esp
    24ad:	68 e0 47 00 00       	push   $0x47e0
    24b2:	6a 01                	push   $0x1
    24b4:	e8 43 15 00 00       	call   39fc <printf>
      exit();
    24b9:	e8 ed 13 00 00       	call   38ab <exit>
  }
  close(fd);
    24be:	83 ec 0c             	sub    $0xc,%esp
    24c1:	57                   	push   %edi
    24c2:	e8 0c 14 00 00       	call   38d3 <close>
  if(total != 20*600){
    24c7:	83 c4 10             	add    $0x10,%esp
    24ca:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    24d0:	75 27                	jne    24f9 <bigfile+0x1a6>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    24d2:	83 ec 0c             	sub    $0xc,%esp
    24d5:	68 84 47 00 00       	push   $0x4784
    24da:	e8 1c 14 00 00       	call   38fb <unlink>

  printf(1, "bigfile test ok\n");
    24df:	83 c4 08             	add    $0x8,%esp
    24e2:	68 13 48 00 00       	push   $0x4813
    24e7:	6a 01                	push   $0x1
    24e9:	e8 0e 15 00 00       	call   39fc <printf>
}
    24ee:	83 c4 10             	add    $0x10,%esp
    24f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    24f4:	5b                   	pop    %ebx
    24f5:	5e                   	pop    %esi
    24f6:	5f                   	pop    %edi
    24f7:	5d                   	pop    %ebp
    24f8:	c3                   	ret    
    printf(1, "read bigfile wrong total\n");
    24f9:	83 ec 08             	sub    $0x8,%esp
    24fc:	68 f9 47 00 00       	push   $0x47f9
    2501:	6a 01                	push   $0x1
    2503:	e8 f4 14 00 00       	call   39fc <printf>
    exit();
    2508:	e8 9e 13 00 00       	call   38ab <exit>

0000250d <fourteen>:

void
fourteen(void)
{
    250d:	f3 0f 1e fb          	endbr32 
    2511:	55                   	push   %ebp
    2512:	89 e5                	mov    %esp,%ebp
    2514:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2517:	68 24 48 00 00       	push   $0x4824
    251c:	6a 01                	push   $0x1
    251e:	e8 d9 14 00 00       	call   39fc <printf>

  if(mkdir("12345678901234") != 0){
    2523:	c7 04 24 5f 48 00 00 	movl   $0x485f,(%esp)
    252a:	e8 e4 13 00 00       	call   3913 <mkdir>
    252f:	83 c4 10             	add    $0x10,%esp
    2532:	85 c0                	test   %eax,%eax
    2534:	0f 85 9c 00 00 00    	jne    25d6 <fourteen+0xc9>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    253a:	83 ec 0c             	sub    $0xc,%esp
    253d:	68 1c 50 00 00       	push   $0x501c
    2542:	e8 cc 13 00 00       	call   3913 <mkdir>
    2547:	83 c4 10             	add    $0x10,%esp
    254a:	85 c0                	test   %eax,%eax
    254c:	0f 85 98 00 00 00    	jne    25ea <fourteen+0xdd>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2552:	83 ec 08             	sub    $0x8,%esp
    2555:	68 00 02 00 00       	push   $0x200
    255a:	68 6c 50 00 00       	push   $0x506c
    255f:	e8 87 13 00 00       	call   38eb <open>
  if(fd < 0){
    2564:	83 c4 10             	add    $0x10,%esp
    2567:	85 c0                	test   %eax,%eax
    2569:	0f 88 8f 00 00 00    	js     25fe <fourteen+0xf1>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    256f:	83 ec 0c             	sub    $0xc,%esp
    2572:	50                   	push   %eax
    2573:	e8 5b 13 00 00       	call   38d3 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2578:	83 c4 08             	add    $0x8,%esp
    257b:	6a 00                	push   $0x0
    257d:	68 dc 50 00 00       	push   $0x50dc
    2582:	e8 64 13 00 00       	call   38eb <open>
  if(fd < 0){
    2587:	83 c4 10             	add    $0x10,%esp
    258a:	85 c0                	test   %eax,%eax
    258c:	0f 88 80 00 00 00    	js     2612 <fourteen+0x105>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    2592:	83 ec 0c             	sub    $0xc,%esp
    2595:	50                   	push   %eax
    2596:	e8 38 13 00 00       	call   38d3 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    259b:	c7 04 24 50 48 00 00 	movl   $0x4850,(%esp)
    25a2:	e8 6c 13 00 00       	call   3913 <mkdir>
    25a7:	83 c4 10             	add    $0x10,%esp
    25aa:	85 c0                	test   %eax,%eax
    25ac:	74 78                	je     2626 <fourteen+0x119>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    25ae:	83 ec 0c             	sub    $0xc,%esp
    25b1:	68 78 51 00 00       	push   $0x5178
    25b6:	e8 58 13 00 00       	call   3913 <mkdir>
    25bb:	83 c4 10             	add    $0x10,%esp
    25be:	85 c0                	test   %eax,%eax
    25c0:	74 78                	je     263a <fourteen+0x12d>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    25c2:	83 ec 08             	sub    $0x8,%esp
    25c5:	68 6e 48 00 00       	push   $0x486e
    25ca:	6a 01                	push   $0x1
    25cc:	e8 2b 14 00 00       	call   39fc <printf>
}
    25d1:	83 c4 10             	add    $0x10,%esp
    25d4:	c9                   	leave  
    25d5:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    25d6:	83 ec 08             	sub    $0x8,%esp
    25d9:	68 33 48 00 00       	push   $0x4833
    25de:	6a 01                	push   $0x1
    25e0:	e8 17 14 00 00       	call   39fc <printf>
    exit();
    25e5:	e8 c1 12 00 00       	call   38ab <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    25ea:	83 ec 08             	sub    $0x8,%esp
    25ed:	68 3c 50 00 00       	push   $0x503c
    25f2:	6a 01                	push   $0x1
    25f4:	e8 03 14 00 00       	call   39fc <printf>
    exit();
    25f9:	e8 ad 12 00 00       	call   38ab <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    25fe:	83 ec 08             	sub    $0x8,%esp
    2601:	68 9c 50 00 00       	push   $0x509c
    2606:	6a 01                	push   $0x1
    2608:	e8 ef 13 00 00       	call   39fc <printf>
    exit();
    260d:	e8 99 12 00 00       	call   38ab <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2612:	83 ec 08             	sub    $0x8,%esp
    2615:	68 0c 51 00 00       	push   $0x510c
    261a:	6a 01                	push   $0x1
    261c:	e8 db 13 00 00       	call   39fc <printf>
    exit();
    2621:	e8 85 12 00 00       	call   38ab <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2626:	83 ec 08             	sub    $0x8,%esp
    2629:	68 48 51 00 00       	push   $0x5148
    262e:	6a 01                	push   $0x1
    2630:	e8 c7 13 00 00       	call   39fc <printf>
    exit();
    2635:	e8 71 12 00 00       	call   38ab <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    263a:	83 ec 08             	sub    $0x8,%esp
    263d:	68 98 51 00 00       	push   $0x5198
    2642:	6a 01                	push   $0x1
    2644:	e8 b3 13 00 00       	call   39fc <printf>
    exit();
    2649:	e8 5d 12 00 00       	call   38ab <exit>

0000264e <rmdot>:

void
rmdot(void)
{
    264e:	f3 0f 1e fb          	endbr32 
    2652:	55                   	push   %ebp
    2653:	89 e5                	mov    %esp,%ebp
    2655:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2658:	68 7b 48 00 00       	push   $0x487b
    265d:	6a 01                	push   $0x1
    265f:	e8 98 13 00 00       	call   39fc <printf>
  if(mkdir("dots") != 0){
    2664:	c7 04 24 87 48 00 00 	movl   $0x4887,(%esp)
    266b:	e8 a3 12 00 00       	call   3913 <mkdir>
    2670:	83 c4 10             	add    $0x10,%esp
    2673:	85 c0                	test   %eax,%eax
    2675:	0f 85 bc 00 00 00    	jne    2737 <rmdot+0xe9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    267b:	83 ec 0c             	sub    $0xc,%esp
    267e:	68 87 48 00 00       	push   $0x4887
    2683:	e8 93 12 00 00       	call   391b <chdir>
    2688:	83 c4 10             	add    $0x10,%esp
    268b:	85 c0                	test   %eax,%eax
    268d:	0f 85 b8 00 00 00    	jne    274b <rmdot+0xfd>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2693:	83 ec 0c             	sub    $0xc,%esp
    2696:	68 32 45 00 00       	push   $0x4532
    269b:	e8 5b 12 00 00       	call   38fb <unlink>
    26a0:	83 c4 10             	add    $0x10,%esp
    26a3:	85 c0                	test   %eax,%eax
    26a5:	0f 84 b4 00 00 00    	je     275f <rmdot+0x111>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    26ab:	83 ec 0c             	sub    $0xc,%esp
    26ae:	68 31 45 00 00       	push   $0x4531
    26b3:	e8 43 12 00 00       	call   38fb <unlink>
    26b8:	83 c4 10             	add    $0x10,%esp
    26bb:	85 c0                	test   %eax,%eax
    26bd:	0f 84 b0 00 00 00    	je     2773 <rmdot+0x125>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    26c3:	83 ec 0c             	sub    $0xc,%esp
    26c6:	68 05 3d 00 00       	push   $0x3d05
    26cb:	e8 4b 12 00 00       	call   391b <chdir>
    26d0:	83 c4 10             	add    $0x10,%esp
    26d3:	85 c0                	test   %eax,%eax
    26d5:	0f 85 ac 00 00 00    	jne    2787 <rmdot+0x139>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    26db:	83 ec 0c             	sub    $0xc,%esp
    26de:	68 cf 48 00 00       	push   $0x48cf
    26e3:	e8 13 12 00 00       	call   38fb <unlink>
    26e8:	83 c4 10             	add    $0x10,%esp
    26eb:	85 c0                	test   %eax,%eax
    26ed:	0f 84 a8 00 00 00    	je     279b <rmdot+0x14d>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    26f3:	83 ec 0c             	sub    $0xc,%esp
    26f6:	68 ed 48 00 00       	push   $0x48ed
    26fb:	e8 fb 11 00 00       	call   38fb <unlink>
    2700:	83 c4 10             	add    $0x10,%esp
    2703:	85 c0                	test   %eax,%eax
    2705:	0f 84 a4 00 00 00    	je     27af <rmdot+0x161>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    270b:	83 ec 0c             	sub    $0xc,%esp
    270e:	68 87 48 00 00       	push   $0x4887
    2713:	e8 e3 11 00 00       	call   38fb <unlink>
    2718:	83 c4 10             	add    $0x10,%esp
    271b:	85 c0                	test   %eax,%eax
    271d:	0f 85 a0 00 00 00    	jne    27c3 <rmdot+0x175>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2723:	83 ec 08             	sub    $0x8,%esp
    2726:	68 22 49 00 00       	push   $0x4922
    272b:	6a 01                	push   $0x1
    272d:	e8 ca 12 00 00       	call   39fc <printf>
}
    2732:	83 c4 10             	add    $0x10,%esp
    2735:	c9                   	leave  
    2736:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    2737:	83 ec 08             	sub    $0x8,%esp
    273a:	68 8c 48 00 00       	push   $0x488c
    273f:	6a 01                	push   $0x1
    2741:	e8 b6 12 00 00       	call   39fc <printf>
    exit();
    2746:	e8 60 11 00 00       	call   38ab <exit>
    printf(1, "chdir dots failed\n");
    274b:	83 ec 08             	sub    $0x8,%esp
    274e:	68 9f 48 00 00       	push   $0x489f
    2753:	6a 01                	push   $0x1
    2755:	e8 a2 12 00 00       	call   39fc <printf>
    exit();
    275a:	e8 4c 11 00 00       	call   38ab <exit>
    printf(1, "rm . worked!\n");
    275f:	83 ec 08             	sub    $0x8,%esp
    2762:	68 b2 48 00 00       	push   $0x48b2
    2767:	6a 01                	push   $0x1
    2769:	e8 8e 12 00 00       	call   39fc <printf>
    exit();
    276e:	e8 38 11 00 00       	call   38ab <exit>
    printf(1, "rm .. worked!\n");
    2773:	83 ec 08             	sub    $0x8,%esp
    2776:	68 c0 48 00 00       	push   $0x48c0
    277b:	6a 01                	push   $0x1
    277d:	e8 7a 12 00 00       	call   39fc <printf>
    exit();
    2782:	e8 24 11 00 00       	call   38ab <exit>
    printf(1, "chdir / failed\n");
    2787:	83 ec 08             	sub    $0x8,%esp
    278a:	68 07 3d 00 00       	push   $0x3d07
    278f:	6a 01                	push   $0x1
    2791:	e8 66 12 00 00       	call   39fc <printf>
    exit();
    2796:	e8 10 11 00 00       	call   38ab <exit>
    printf(1, "unlink dots/. worked!\n");
    279b:	83 ec 08             	sub    $0x8,%esp
    279e:	68 d6 48 00 00       	push   $0x48d6
    27a3:	6a 01                	push   $0x1
    27a5:	e8 52 12 00 00       	call   39fc <printf>
    exit();
    27aa:	e8 fc 10 00 00       	call   38ab <exit>
    printf(1, "unlink dots/.. worked!\n");
    27af:	83 ec 08             	sub    $0x8,%esp
    27b2:	68 f5 48 00 00       	push   $0x48f5
    27b7:	6a 01                	push   $0x1
    27b9:	e8 3e 12 00 00       	call   39fc <printf>
    exit();
    27be:	e8 e8 10 00 00       	call   38ab <exit>
    printf(1, "unlink dots failed!\n");
    27c3:	83 ec 08             	sub    $0x8,%esp
    27c6:	68 0d 49 00 00       	push   $0x490d
    27cb:	6a 01                	push   $0x1
    27cd:	e8 2a 12 00 00       	call   39fc <printf>
    exit();
    27d2:	e8 d4 10 00 00       	call   38ab <exit>

000027d7 <dirfile>:

void
dirfile(void)
{
    27d7:	f3 0f 1e fb          	endbr32 
    27db:	55                   	push   %ebp
    27dc:	89 e5                	mov    %esp,%ebp
    27de:	53                   	push   %ebx
    27df:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    27e2:	68 2c 49 00 00       	push   $0x492c
    27e7:	6a 01                	push   $0x1
    27e9:	e8 0e 12 00 00       	call   39fc <printf>

  fd = open("dirfile", O_CREATE);
    27ee:	83 c4 08             	add    $0x8,%esp
    27f1:	68 00 02 00 00       	push   $0x200
    27f6:	68 39 49 00 00       	push   $0x4939
    27fb:	e8 eb 10 00 00       	call   38eb <open>
  if(fd < 0){
    2800:	83 c4 10             	add    $0x10,%esp
    2803:	85 c0                	test   %eax,%eax
    2805:	0f 88 22 01 00 00    	js     292d <dirfile+0x156>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    280b:	83 ec 0c             	sub    $0xc,%esp
    280e:	50                   	push   %eax
    280f:	e8 bf 10 00 00       	call   38d3 <close>
  if(chdir("dirfile") == 0){
    2814:	c7 04 24 39 49 00 00 	movl   $0x4939,(%esp)
    281b:	e8 fb 10 00 00       	call   391b <chdir>
    2820:	83 c4 10             	add    $0x10,%esp
    2823:	85 c0                	test   %eax,%eax
    2825:	0f 84 16 01 00 00    	je     2941 <dirfile+0x16a>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    282b:	83 ec 08             	sub    $0x8,%esp
    282e:	6a 00                	push   $0x0
    2830:	68 72 49 00 00       	push   $0x4972
    2835:	e8 b1 10 00 00       	call   38eb <open>
  if(fd >= 0){
    283a:	83 c4 10             	add    $0x10,%esp
    283d:	85 c0                	test   %eax,%eax
    283f:	0f 89 10 01 00 00    	jns    2955 <dirfile+0x17e>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    2845:	83 ec 08             	sub    $0x8,%esp
    2848:	68 00 02 00 00       	push   $0x200
    284d:	68 72 49 00 00       	push   $0x4972
    2852:	e8 94 10 00 00       	call   38eb <open>
  if(fd >= 0){
    2857:	83 c4 10             	add    $0x10,%esp
    285a:	85 c0                	test   %eax,%eax
    285c:	0f 89 07 01 00 00    	jns    2969 <dirfile+0x192>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    2862:	83 ec 0c             	sub    $0xc,%esp
    2865:	68 72 49 00 00       	push   $0x4972
    286a:	e8 a4 10 00 00       	call   3913 <mkdir>
    286f:	83 c4 10             	add    $0x10,%esp
    2872:	85 c0                	test   %eax,%eax
    2874:	0f 84 03 01 00 00    	je     297d <dirfile+0x1a6>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    287a:	83 ec 0c             	sub    $0xc,%esp
    287d:	68 72 49 00 00       	push   $0x4972
    2882:	e8 74 10 00 00       	call   38fb <unlink>
    2887:	83 c4 10             	add    $0x10,%esp
    288a:	85 c0                	test   %eax,%eax
    288c:	0f 84 ff 00 00 00    	je     2991 <dirfile+0x1ba>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    2892:	83 ec 08             	sub    $0x8,%esp
    2895:	68 72 49 00 00       	push   $0x4972
    289a:	68 d6 49 00 00       	push   $0x49d6
    289f:	e8 67 10 00 00       	call   390b <link>
    28a4:	83 c4 10             	add    $0x10,%esp
    28a7:	85 c0                	test   %eax,%eax
    28a9:	0f 84 f6 00 00 00    	je     29a5 <dirfile+0x1ce>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    28af:	83 ec 0c             	sub    $0xc,%esp
    28b2:	68 39 49 00 00       	push   $0x4939
    28b7:	e8 3f 10 00 00       	call   38fb <unlink>
    28bc:	83 c4 10             	add    $0x10,%esp
    28bf:	85 c0                	test   %eax,%eax
    28c1:	0f 85 f2 00 00 00    	jne    29b9 <dirfile+0x1e2>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    28c7:	83 ec 08             	sub    $0x8,%esp
    28ca:	6a 02                	push   $0x2
    28cc:	68 32 45 00 00       	push   $0x4532
    28d1:	e8 15 10 00 00       	call   38eb <open>
  if(fd >= 0){
    28d6:	83 c4 10             	add    $0x10,%esp
    28d9:	85 c0                	test   %eax,%eax
    28db:	0f 89 ec 00 00 00    	jns    29cd <dirfile+0x1f6>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    28e1:	83 ec 08             	sub    $0x8,%esp
    28e4:	6a 00                	push   $0x0
    28e6:	68 32 45 00 00       	push   $0x4532
    28eb:	e8 fb 0f 00 00       	call   38eb <open>
    28f0:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    28f2:	83 c4 0c             	add    $0xc,%esp
    28f5:	6a 01                	push   $0x1
    28f7:	68 15 46 00 00       	push   $0x4615
    28fc:	50                   	push   %eax
    28fd:	e8 c9 0f 00 00       	call   38cb <write>
    2902:	83 c4 10             	add    $0x10,%esp
    2905:	85 c0                	test   %eax,%eax
    2907:	0f 8f d4 00 00 00    	jg     29e1 <dirfile+0x20a>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    290d:	83 ec 0c             	sub    $0xc,%esp
    2910:	53                   	push   %ebx
    2911:	e8 bd 0f 00 00       	call   38d3 <close>

  printf(1, "dir vs file OK\n");
    2916:	83 c4 08             	add    $0x8,%esp
    2919:	68 09 4a 00 00       	push   $0x4a09
    291e:	6a 01                	push   $0x1
    2920:	e8 d7 10 00 00       	call   39fc <printf>
}
    2925:	83 c4 10             	add    $0x10,%esp
    2928:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    292b:	c9                   	leave  
    292c:	c3                   	ret    
    printf(1, "create dirfile failed\n");
    292d:	83 ec 08             	sub    $0x8,%esp
    2930:	68 41 49 00 00       	push   $0x4941
    2935:	6a 01                	push   $0x1
    2937:	e8 c0 10 00 00       	call   39fc <printf>
    exit();
    293c:	e8 6a 0f 00 00       	call   38ab <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2941:	83 ec 08             	sub    $0x8,%esp
    2944:	68 58 49 00 00       	push   $0x4958
    2949:	6a 01                	push   $0x1
    294b:	e8 ac 10 00 00       	call   39fc <printf>
    exit();
    2950:	e8 56 0f 00 00       	call   38ab <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    2955:	83 ec 08             	sub    $0x8,%esp
    2958:	68 7d 49 00 00       	push   $0x497d
    295d:	6a 01                	push   $0x1
    295f:	e8 98 10 00 00       	call   39fc <printf>
    exit();
    2964:	e8 42 0f 00 00       	call   38ab <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    2969:	83 ec 08             	sub    $0x8,%esp
    296c:	68 7d 49 00 00       	push   $0x497d
    2971:	6a 01                	push   $0x1
    2973:	e8 84 10 00 00       	call   39fc <printf>
    exit();
    2978:	e8 2e 0f 00 00       	call   38ab <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    297d:	83 ec 08             	sub    $0x8,%esp
    2980:	68 9b 49 00 00       	push   $0x499b
    2985:	6a 01                	push   $0x1
    2987:	e8 70 10 00 00       	call   39fc <printf>
    exit();
    298c:	e8 1a 0f 00 00       	call   38ab <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2991:	83 ec 08             	sub    $0x8,%esp
    2994:	68 b8 49 00 00       	push   $0x49b8
    2999:	6a 01                	push   $0x1
    299b:	e8 5c 10 00 00       	call   39fc <printf>
    exit();
    29a0:	e8 06 0f 00 00       	call   38ab <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    29a5:	83 ec 08             	sub    $0x8,%esp
    29a8:	68 cc 51 00 00       	push   $0x51cc
    29ad:	6a 01                	push   $0x1
    29af:	e8 48 10 00 00       	call   39fc <printf>
    exit();
    29b4:	e8 f2 0e 00 00       	call   38ab <exit>
    printf(1, "unlink dirfile failed!\n");
    29b9:	83 ec 08             	sub    $0x8,%esp
    29bc:	68 dd 49 00 00       	push   $0x49dd
    29c1:	6a 01                	push   $0x1
    29c3:	e8 34 10 00 00       	call   39fc <printf>
    exit();
    29c8:	e8 de 0e 00 00       	call   38ab <exit>
    printf(1, "open . for writing succeeded!\n");
    29cd:	83 ec 08             	sub    $0x8,%esp
    29d0:	68 ec 51 00 00       	push   $0x51ec
    29d5:	6a 01                	push   $0x1
    29d7:	e8 20 10 00 00       	call   39fc <printf>
    exit();
    29dc:	e8 ca 0e 00 00       	call   38ab <exit>
    printf(1, "write . succeeded!\n");
    29e1:	83 ec 08             	sub    $0x8,%esp
    29e4:	68 f5 49 00 00       	push   $0x49f5
    29e9:	6a 01                	push   $0x1
    29eb:	e8 0c 10 00 00       	call   39fc <printf>
    exit();
    29f0:	e8 b6 0e 00 00       	call   38ab <exit>

000029f5 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    29f5:	f3 0f 1e fb          	endbr32 
    29f9:	55                   	push   %ebp
    29fa:	89 e5                	mov    %esp,%ebp
    29fc:	53                   	push   %ebx
    29fd:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2a00:	68 19 4a 00 00       	push   $0x4a19
    2a05:	6a 01                	push   $0x1
    2a07:	e8 f0 0f 00 00       	call   39fc <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2a0c:	83 c4 10             	add    $0x10,%esp
    2a0f:	bb 00 00 00 00       	mov    $0x0,%ebx
    2a14:	eb 4c                	jmp    2a62 <iref+0x6d>
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2a16:	83 ec 08             	sub    $0x8,%esp
    2a19:	68 30 4a 00 00       	push   $0x4a30
    2a1e:	6a 01                	push   $0x1
    2a20:	e8 d7 0f 00 00       	call   39fc <printf>
      exit();
    2a25:	e8 81 0e 00 00       	call   38ab <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2a2a:	83 ec 08             	sub    $0x8,%esp
    2a2d:	68 44 4a 00 00       	push   $0x4a44
    2a32:	6a 01                	push   $0x1
    2a34:	e8 c3 0f 00 00       	call   39fc <printf>
      exit();
    2a39:	e8 6d 0e 00 00       	call   38ab <exit>

    mkdir("");
    link("README", "");
    fd = open("", O_CREATE);
    if(fd >= 0)
      close(fd);
    2a3e:	83 ec 0c             	sub    $0xc,%esp
    2a41:	50                   	push   %eax
    2a42:	e8 8c 0e 00 00       	call   38d3 <close>
    2a47:	83 c4 10             	add    $0x10,%esp
    2a4a:	e9 80 00 00 00       	jmp    2acf <iref+0xda>
    fd = open("xx", O_CREATE);
    if(fd >= 0)
      close(fd);
    unlink("xx");
    2a4f:	83 ec 0c             	sub    $0xc,%esp
    2a52:	68 14 46 00 00       	push   $0x4614
    2a57:	e8 9f 0e 00 00       	call   38fb <unlink>
  for(i = 0; i < 50 + 1; i++){
    2a5c:	83 c3 01             	add    $0x1,%ebx
    2a5f:	83 c4 10             	add    $0x10,%esp
    2a62:	83 fb 32             	cmp    $0x32,%ebx
    2a65:	0f 8f 92 00 00 00    	jg     2afd <iref+0x108>
    if(mkdir("irefd") != 0){
    2a6b:	83 ec 0c             	sub    $0xc,%esp
    2a6e:	68 2a 4a 00 00       	push   $0x4a2a
    2a73:	e8 9b 0e 00 00       	call   3913 <mkdir>
    2a78:	83 c4 10             	add    $0x10,%esp
    2a7b:	85 c0                	test   %eax,%eax
    2a7d:	75 97                	jne    2a16 <iref+0x21>
    if(chdir("irefd") != 0){
    2a7f:	83 ec 0c             	sub    $0xc,%esp
    2a82:	68 2a 4a 00 00       	push   $0x4a2a
    2a87:	e8 8f 0e 00 00       	call   391b <chdir>
    2a8c:	83 c4 10             	add    $0x10,%esp
    2a8f:	85 c0                	test   %eax,%eax
    2a91:	75 97                	jne    2a2a <iref+0x35>
    mkdir("");
    2a93:	83 ec 0c             	sub    $0xc,%esp
    2a96:	68 df 40 00 00       	push   $0x40df
    2a9b:	e8 73 0e 00 00       	call   3913 <mkdir>
    link("README", "");
    2aa0:	83 c4 08             	add    $0x8,%esp
    2aa3:	68 df 40 00 00       	push   $0x40df
    2aa8:	68 d6 49 00 00       	push   $0x49d6
    2aad:	e8 59 0e 00 00       	call   390b <link>
    fd = open("", O_CREATE);
    2ab2:	83 c4 08             	add    $0x8,%esp
    2ab5:	68 00 02 00 00       	push   $0x200
    2aba:	68 df 40 00 00       	push   $0x40df
    2abf:	e8 27 0e 00 00       	call   38eb <open>
    if(fd >= 0)
    2ac4:	83 c4 10             	add    $0x10,%esp
    2ac7:	85 c0                	test   %eax,%eax
    2ac9:	0f 89 6f ff ff ff    	jns    2a3e <iref+0x49>
    fd = open("xx", O_CREATE);
    2acf:	83 ec 08             	sub    $0x8,%esp
    2ad2:	68 00 02 00 00       	push   $0x200
    2ad7:	68 14 46 00 00       	push   $0x4614
    2adc:	e8 0a 0e 00 00       	call   38eb <open>
    if(fd >= 0)
    2ae1:	83 c4 10             	add    $0x10,%esp
    2ae4:	85 c0                	test   %eax,%eax
    2ae6:	0f 88 63 ff ff ff    	js     2a4f <iref+0x5a>
      close(fd);
    2aec:	83 ec 0c             	sub    $0xc,%esp
    2aef:	50                   	push   %eax
    2af0:	e8 de 0d 00 00       	call   38d3 <close>
    2af5:	83 c4 10             	add    $0x10,%esp
    2af8:	e9 52 ff ff ff       	jmp    2a4f <iref+0x5a>
  }

  chdir("/");
    2afd:	83 ec 0c             	sub    $0xc,%esp
    2b00:	68 05 3d 00 00       	push   $0x3d05
    2b05:	e8 11 0e 00 00       	call   391b <chdir>
  printf(1, "empty file name OK\n");
    2b0a:	83 c4 08             	add    $0x8,%esp
    2b0d:	68 58 4a 00 00       	push   $0x4a58
    2b12:	6a 01                	push   $0x1
    2b14:	e8 e3 0e 00 00       	call   39fc <printf>
}
    2b19:	83 c4 10             	add    $0x10,%esp
    2b1c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b1f:	c9                   	leave  
    2b20:	c3                   	ret    

00002b21 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2b21:	f3 0f 1e fb          	endbr32 
    2b25:	55                   	push   %ebp
    2b26:	89 e5                	mov    %esp,%ebp
    2b28:	53                   	push   %ebx
    2b29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2b2c:	68 6c 4a 00 00       	push   $0x4a6c
    2b31:	6a 01                	push   $0x1
    2b33:	e8 c4 0e 00 00       	call   39fc <printf>

  for(n=0; n<1000; n++){
    2b38:	83 c4 10             	add    $0x10,%esp
    2b3b:	bb 00 00 00 00       	mov    $0x0,%ebx
    2b40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
    2b46:	7f 15                	jg     2b5d <forktest+0x3c>
    pid = fork();
    2b48:	e8 56 0d 00 00       	call   38a3 <fork>
    if(pid < 0)
    2b4d:	85 c0                	test   %eax,%eax
    2b4f:	78 0c                	js     2b5d <forktest+0x3c>
      break;
    if(pid == 0)
    2b51:	74 05                	je     2b58 <forktest+0x37>
  for(n=0; n<1000; n++){
    2b53:	83 c3 01             	add    $0x1,%ebx
    2b56:	eb e8                	jmp    2b40 <forktest+0x1f>
      exit();
    2b58:	e8 4e 0d 00 00       	call   38ab <exit>
  }

  if(n == 1000){
    2b5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2b63:	74 12                	je     2b77 <forktest+0x56>
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2b65:	85 db                	test   %ebx,%ebx
    2b67:	7e 36                	jle    2b9f <forktest+0x7e>
    if(wait() < 0){
    2b69:	e8 45 0d 00 00       	call   38b3 <wait>
    2b6e:	85 c0                	test   %eax,%eax
    2b70:	78 19                	js     2b8b <forktest+0x6a>
  for(; n > 0; n--){
    2b72:	83 eb 01             	sub    $0x1,%ebx
    2b75:	eb ee                	jmp    2b65 <forktest+0x44>
    printf(1, "fork claimed to work 1000 times!\n");
    2b77:	83 ec 08             	sub    $0x8,%esp
    2b7a:	68 0c 52 00 00       	push   $0x520c
    2b7f:	6a 01                	push   $0x1
    2b81:	e8 76 0e 00 00       	call   39fc <printf>
    exit();
    2b86:	e8 20 0d 00 00       	call   38ab <exit>
      printf(1, "wait stopped early\n");
    2b8b:	83 ec 08             	sub    $0x8,%esp
    2b8e:	68 77 4a 00 00       	push   $0x4a77
    2b93:	6a 01                	push   $0x1
    2b95:	e8 62 0e 00 00       	call   39fc <printf>
      exit();
    2b9a:	e8 0c 0d 00 00       	call   38ab <exit>
    }
  }

  if(wait() != -1){
    2b9f:	e8 0f 0d 00 00       	call   38b3 <wait>
    2ba4:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ba7:	75 17                	jne    2bc0 <forktest+0x9f>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2ba9:	83 ec 08             	sub    $0x8,%esp
    2bac:	68 9e 4a 00 00       	push   $0x4a9e
    2bb1:	6a 01                	push   $0x1
    2bb3:	e8 44 0e 00 00       	call   39fc <printf>
}
    2bb8:	83 c4 10             	add    $0x10,%esp
    2bbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2bbe:	c9                   	leave  
    2bbf:	c3                   	ret    
    printf(1, "wait got too many\n");
    2bc0:	83 ec 08             	sub    $0x8,%esp
    2bc3:	68 8b 4a 00 00       	push   $0x4a8b
    2bc8:	6a 01                	push   $0x1
    2bca:	e8 2d 0e 00 00       	call   39fc <printf>
    exit();
    2bcf:	e8 d7 0c 00 00       	call   38ab <exit>

00002bd4 <sbrktest>:

void
sbrktest(void)
{
    2bd4:	f3 0f 1e fb          	endbr32 
    2bd8:	55                   	push   %ebp
    2bd9:	89 e5                	mov    %esp,%ebp
    2bdb:	57                   	push   %edi
    2bdc:	56                   	push   %esi
    2bdd:	53                   	push   %ebx
    2bde:	83 ec 54             	sub    $0x54,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2be1:	68 ac 4a 00 00       	push   $0x4aac
    2be6:	ff 35 48 5d 00 00    	pushl  0x5d48
    2bec:	e8 0b 0e 00 00       	call   39fc <printf>
  oldbrk = sbrk(0);
    2bf1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bf8:	e8 36 0d 00 00       	call   3933 <sbrk>
    2bfd:	89 c7                	mov    %eax,%edi

  // can one sbrk() less than a page?
  a = sbrk(0);
    2bff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c06:	e8 28 0d 00 00       	call   3933 <sbrk>
    2c0b:	89 c6                	mov    %eax,%esi
  int i;
  for(i = 0; i < 5000; i++){
    2c0d:	83 c4 10             	add    $0x10,%esp
    2c10:	bb 00 00 00 00       	mov    $0x0,%ebx
    2c15:	81 fb 87 13 00 00    	cmp    $0x1387,%ebx
    2c1b:	7f 3a                	jg     2c57 <sbrktest+0x83>
    b = sbrk(1);
    2c1d:	83 ec 0c             	sub    $0xc,%esp
    2c20:	6a 01                	push   $0x1
    2c22:	e8 0c 0d 00 00       	call   3933 <sbrk>
    if(b != a){
    2c27:	83 c4 10             	add    $0x10,%esp
    2c2a:	39 c6                	cmp    %eax,%esi
    2c2c:	75 0b                	jne    2c39 <sbrktest+0x65>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2c2e:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    2c31:	8d 70 01             	lea    0x1(%eax),%esi
  for(i = 0; i < 5000; i++){
    2c34:	83 c3 01             	add    $0x1,%ebx
    2c37:	eb dc                	jmp    2c15 <sbrktest+0x41>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2c39:	83 ec 0c             	sub    $0xc,%esp
    2c3c:	50                   	push   %eax
    2c3d:	56                   	push   %esi
    2c3e:	53                   	push   %ebx
    2c3f:	68 b7 4a 00 00       	push   $0x4ab7
    2c44:	ff 35 48 5d 00 00    	pushl  0x5d48
    2c4a:	e8 ad 0d 00 00       	call   39fc <printf>
      exit();
    2c4f:	83 c4 20             	add    $0x20,%esp
    2c52:	e8 54 0c 00 00       	call   38ab <exit>
  }
  pid = fork();
    2c57:	e8 47 0c 00 00       	call   38a3 <fork>
    2c5c:	89 c3                	mov    %eax,%ebx
  if(pid < 0){
    2c5e:	85 c0                	test   %eax,%eax
    2c60:	0f 88 51 01 00 00    	js     2db7 <sbrktest+0x1e3>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2c66:	83 ec 0c             	sub    $0xc,%esp
    2c69:	6a 01                	push   $0x1
    2c6b:	e8 c3 0c 00 00       	call   3933 <sbrk>
  c = sbrk(1);
    2c70:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c77:	e8 b7 0c 00 00       	call   3933 <sbrk>
  if(c != a + 1){
    2c7c:	83 c6 01             	add    $0x1,%esi
    2c7f:	83 c4 10             	add    $0x10,%esp
    2c82:	39 c6                	cmp    %eax,%esi
    2c84:	0f 85 45 01 00 00    	jne    2dcf <sbrktest+0x1fb>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2c8a:	85 db                	test   %ebx,%ebx
    2c8c:	0f 84 55 01 00 00    	je     2de7 <sbrktest+0x213>
    exit();
  wait();
    2c92:	e8 1c 0c 00 00       	call   38b3 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2c97:	83 ec 0c             	sub    $0xc,%esp
    2c9a:	6a 00                	push   $0x0
    2c9c:	e8 92 0c 00 00       	call   3933 <sbrk>
    2ca1:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2ca3:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2ca8:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2caa:	89 04 24             	mov    %eax,(%esp)
    2cad:	e8 81 0c 00 00       	call   3933 <sbrk>
  if (p != a) {
    2cb2:	83 c4 10             	add    $0x10,%esp
    2cb5:	39 c3                	cmp    %eax,%ebx
    2cb7:	0f 85 2f 01 00 00    	jne    2dec <sbrktest+0x218>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2cbd:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2cc4:	83 ec 0c             	sub    $0xc,%esp
    2cc7:	6a 00                	push   $0x0
    2cc9:	e8 65 0c 00 00       	call   3933 <sbrk>
    2cce:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2cd0:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2cd7:	e8 57 0c 00 00       	call   3933 <sbrk>
  if(c == (char*)0xffffffff){
    2cdc:	83 c4 10             	add    $0x10,%esp
    2cdf:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ce2:	0f 84 1c 01 00 00    	je     2e04 <sbrktest+0x230>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2ce8:	83 ec 0c             	sub    $0xc,%esp
    2ceb:	6a 00                	push   $0x0
    2ced:	e8 41 0c 00 00       	call   3933 <sbrk>
  if(c != a - 4096){
    2cf2:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2cf8:	83 c4 10             	add    $0x10,%esp
    2cfb:	39 c2                	cmp    %eax,%edx
    2cfd:	0f 85 19 01 00 00    	jne    2e1c <sbrktest+0x248>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2d03:	83 ec 0c             	sub    $0xc,%esp
    2d06:	6a 00                	push   $0x0
    2d08:	e8 26 0c 00 00       	call   3933 <sbrk>
    2d0d:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2d0f:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2d16:	e8 18 0c 00 00       	call   3933 <sbrk>
    2d1b:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2d1d:	83 c4 10             	add    $0x10,%esp
    2d20:	39 c3                	cmp    %eax,%ebx
    2d22:	0f 85 0b 01 00 00    	jne    2e33 <sbrktest+0x25f>
    2d28:	83 ec 0c             	sub    $0xc,%esp
    2d2b:	6a 00                	push   $0x0
    2d2d:	e8 01 0c 00 00       	call   3933 <sbrk>
    2d32:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2d38:	83 c4 10             	add    $0x10,%esp
    2d3b:	39 c2                	cmp    %eax,%edx
    2d3d:	0f 85 f0 00 00 00    	jne    2e33 <sbrktest+0x25f>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2d43:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2d4a:	0f 84 fa 00 00 00    	je     2e4a <sbrktest+0x276>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2d50:	83 ec 0c             	sub    $0xc,%esp
    2d53:	6a 00                	push   $0x0
    2d55:	e8 d9 0b 00 00       	call   3933 <sbrk>
    2d5a:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2d5c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d63:	e8 cb 0b 00 00       	call   3933 <sbrk>
    2d68:	89 f9                	mov    %edi,%ecx
    2d6a:	29 c1                	sub    %eax,%ecx
    2d6c:	89 0c 24             	mov    %ecx,(%esp)
    2d6f:	e8 bf 0b 00 00       	call   3933 <sbrk>
  if(c != a){
    2d74:	83 c4 10             	add    $0x10,%esp
    2d77:	39 c3                	cmp    %eax,%ebx
    2d79:	0f 85 e3 00 00 00    	jne    2e62 <sbrktest+0x28e>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2d7f:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2d84:	81 fb 7f 84 1e 80    	cmp    $0x801e847f,%ebx
    2d8a:	0f 87 23 01 00 00    	ja     2eb3 <sbrktest+0x2df>
    ppid = getpid();
    2d90:	e8 96 0b 00 00       	call   392b <getpid>
    2d95:	89 c6                	mov    %eax,%esi
    pid = fork();
    2d97:	e8 07 0b 00 00       	call   38a3 <fork>
    if(pid < 0){
    2d9c:	85 c0                	test   %eax,%eax
    2d9e:	0f 88 d5 00 00 00    	js     2e79 <sbrktest+0x2a5>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2da4:	0f 84 e7 00 00 00    	je     2e91 <sbrktest+0x2bd>
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2daa:	e8 04 0b 00 00       	call   38b3 <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2daf:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2db5:	eb cd                	jmp    2d84 <sbrktest+0x1b0>
    printf(stdout, "sbrk test fork failed\n");
    2db7:	83 ec 08             	sub    $0x8,%esp
    2dba:	68 d2 4a 00 00       	push   $0x4ad2
    2dbf:	ff 35 48 5d 00 00    	pushl  0x5d48
    2dc5:	e8 32 0c 00 00       	call   39fc <printf>
    exit();
    2dca:	e8 dc 0a 00 00       	call   38ab <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2dcf:	83 ec 08             	sub    $0x8,%esp
    2dd2:	68 e9 4a 00 00       	push   $0x4ae9
    2dd7:	ff 35 48 5d 00 00    	pushl  0x5d48
    2ddd:	e8 1a 0c 00 00       	call   39fc <printf>
    exit();
    2de2:	e8 c4 0a 00 00       	call   38ab <exit>
    exit();
    2de7:	e8 bf 0a 00 00       	call   38ab <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2dec:	83 ec 08             	sub    $0x8,%esp
    2def:	68 30 52 00 00       	push   $0x5230
    2df4:	ff 35 48 5d 00 00    	pushl  0x5d48
    2dfa:	e8 fd 0b 00 00       	call   39fc <printf>
    exit();
    2dff:	e8 a7 0a 00 00       	call   38ab <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2e04:	83 ec 08             	sub    $0x8,%esp
    2e07:	68 05 4b 00 00       	push   $0x4b05
    2e0c:	ff 35 48 5d 00 00    	pushl  0x5d48
    2e12:	e8 e5 0b 00 00       	call   39fc <printf>
    exit();
    2e17:	e8 8f 0a 00 00       	call   38ab <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2e1c:	50                   	push   %eax
    2e1d:	53                   	push   %ebx
    2e1e:	68 70 52 00 00       	push   $0x5270
    2e23:	ff 35 48 5d 00 00    	pushl  0x5d48
    2e29:	e8 ce 0b 00 00       	call   39fc <printf>
    exit();
    2e2e:	e8 78 0a 00 00       	call   38ab <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2e33:	56                   	push   %esi
    2e34:	53                   	push   %ebx
    2e35:	68 a8 52 00 00       	push   $0x52a8
    2e3a:	ff 35 48 5d 00 00    	pushl  0x5d48
    2e40:	e8 b7 0b 00 00       	call   39fc <printf>
    exit();
    2e45:	e8 61 0a 00 00       	call   38ab <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2e4a:	83 ec 08             	sub    $0x8,%esp
    2e4d:	68 d0 52 00 00       	push   $0x52d0
    2e52:	ff 35 48 5d 00 00    	pushl  0x5d48
    2e58:	e8 9f 0b 00 00       	call   39fc <printf>
    exit();
    2e5d:	e8 49 0a 00 00       	call   38ab <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2e62:	50                   	push   %eax
    2e63:	53                   	push   %ebx
    2e64:	68 00 53 00 00       	push   $0x5300
    2e69:	ff 35 48 5d 00 00    	pushl  0x5d48
    2e6f:	e8 88 0b 00 00       	call   39fc <printf>
    exit();
    2e74:	e8 32 0a 00 00       	call   38ab <exit>
      printf(stdout, "fork failed\n");
    2e79:	83 ec 08             	sub    $0x8,%esp
    2e7c:	68 fd 4b 00 00       	push   $0x4bfd
    2e81:	ff 35 48 5d 00 00    	pushl  0x5d48
    2e87:	e8 70 0b 00 00       	call   39fc <printf>
      exit();
    2e8c:	e8 1a 0a 00 00       	call   38ab <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2e91:	0f be 03             	movsbl (%ebx),%eax
    2e94:	50                   	push   %eax
    2e95:	53                   	push   %ebx
    2e96:	68 20 4b 00 00       	push   $0x4b20
    2e9b:	ff 35 48 5d 00 00    	pushl  0x5d48
    2ea1:	e8 56 0b 00 00       	call   39fc <printf>
      kill(ppid);
    2ea6:	89 34 24             	mov    %esi,(%esp)
    2ea9:	e8 2d 0a 00 00       	call   38db <kill>
      exit();
    2eae:	e8 f8 09 00 00       	call   38ab <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2eb3:	83 ec 0c             	sub    $0xc,%esp
    2eb6:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2eb9:	50                   	push   %eax
    2eba:	e8 fc 09 00 00       	call   38bb <pipe>
    2ebf:	89 c3                	mov    %eax,%ebx
    2ec1:	83 c4 10             	add    $0x10,%esp
    2ec4:	85 c0                	test   %eax,%eax
    2ec6:	75 04                	jne    2ecc <sbrktest+0x2f8>
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2ec8:	89 c6                	mov    %eax,%esi
    2eca:	eb 59                	jmp    2f25 <sbrktest+0x351>
    printf(1, "pipe() failed\n");
    2ecc:	83 ec 08             	sub    $0x8,%esp
    2ecf:	68 f5 3f 00 00       	push   $0x3ff5
    2ed4:	6a 01                	push   $0x1
    2ed6:	e8 21 0b 00 00       	call   39fc <printf>
    exit();
    2edb:	e8 cb 09 00 00       	call   38ab <exit>
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2ee0:	83 ec 0c             	sub    $0xc,%esp
    2ee3:	6a 00                	push   $0x0
    2ee5:	e8 49 0a 00 00       	call   3933 <sbrk>
    2eea:	89 c2                	mov    %eax,%edx
    2eec:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2ef1:	29 d0                	sub    %edx,%eax
    2ef3:	89 04 24             	mov    %eax,(%esp)
    2ef6:	e8 38 0a 00 00       	call   3933 <sbrk>
      write(fds[1], "x", 1);
    2efb:	83 c4 0c             	add    $0xc,%esp
    2efe:	6a 01                	push   $0x1
    2f00:	68 15 46 00 00       	push   $0x4615
    2f05:	ff 75 e4             	pushl  -0x1c(%ebp)
    2f08:	e8 be 09 00 00       	call   38cb <write>
    2f0d:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    2f10:	83 ec 0c             	sub    $0xc,%esp
    2f13:	68 e8 03 00 00       	push   $0x3e8
    2f18:	e8 1e 0a 00 00       	call   393b <sleep>
    2f1d:	83 c4 10             	add    $0x10,%esp
    2f20:	eb ee                	jmp    2f10 <sbrktest+0x33c>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f22:	83 c6 01             	add    $0x1,%esi
    2f25:	83 fe 09             	cmp    $0x9,%esi
    2f28:	77 28                	ja     2f52 <sbrktest+0x37e>
    if((pids[i] = fork()) == 0){
    2f2a:	e8 74 09 00 00       	call   38a3 <fork>
    2f2f:	89 44 b5 b8          	mov    %eax,-0x48(%ebp,%esi,4)
    2f33:	85 c0                	test   %eax,%eax
    2f35:	74 a9                	je     2ee0 <sbrktest+0x30c>
    }
    if(pids[i] != -1)
    2f37:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f3a:	74 e6                	je     2f22 <sbrktest+0x34e>
      read(fds[0], &scratch, 1);
    2f3c:	83 ec 04             	sub    $0x4,%esp
    2f3f:	6a 01                	push   $0x1
    2f41:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f44:	50                   	push   %eax
    2f45:	ff 75 e0             	pushl  -0x20(%ebp)
    2f48:	e8 76 09 00 00       	call   38c3 <read>
    2f4d:	83 c4 10             	add    $0x10,%esp
    2f50:	eb d0                	jmp    2f22 <sbrktest+0x34e>
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2f52:	83 ec 0c             	sub    $0xc,%esp
    2f55:	68 00 10 00 00       	push   $0x1000
    2f5a:	e8 d4 09 00 00       	call   3933 <sbrk>
    2f5f:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f61:	83 c4 10             	add    $0x10,%esp
    2f64:	eb 03                	jmp    2f69 <sbrktest+0x395>
    2f66:	83 c3 01             	add    $0x1,%ebx
    2f69:	83 fb 09             	cmp    $0x9,%ebx
    2f6c:	77 1c                	ja     2f8a <sbrktest+0x3b6>
    if(pids[i] == -1)
    2f6e:	8b 44 9d b8          	mov    -0x48(%ebp,%ebx,4),%eax
    2f72:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f75:	74 ef                	je     2f66 <sbrktest+0x392>
      continue;
    kill(pids[i]);
    2f77:	83 ec 0c             	sub    $0xc,%esp
    2f7a:	50                   	push   %eax
    2f7b:	e8 5b 09 00 00       	call   38db <kill>
    wait();
    2f80:	e8 2e 09 00 00       	call   38b3 <wait>
    2f85:	83 c4 10             	add    $0x10,%esp
    2f88:	eb dc                	jmp    2f66 <sbrktest+0x392>
  }
  if(c == (char*)0xffffffff){
    2f8a:	83 fe ff             	cmp    $0xffffffff,%esi
    2f8d:	74 2f                	je     2fbe <sbrktest+0x3ea>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f8f:	83 ec 0c             	sub    $0xc,%esp
    2f92:	6a 00                	push   $0x0
    2f94:	e8 9a 09 00 00       	call   3933 <sbrk>
    2f99:	83 c4 10             	add    $0x10,%esp
    2f9c:	39 c7                	cmp    %eax,%edi
    2f9e:	72 36                	jb     2fd6 <sbrktest+0x402>
    sbrk(-(sbrk(0) - oldbrk));

  printf(stdout, "sbrk test OK\n");
    2fa0:	83 ec 08             	sub    $0x8,%esp
    2fa3:	68 54 4b 00 00       	push   $0x4b54
    2fa8:	ff 35 48 5d 00 00    	pushl  0x5d48
    2fae:	e8 49 0a 00 00       	call   39fc <printf>
}
    2fb3:	83 c4 10             	add    $0x10,%esp
    2fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fb9:	5b                   	pop    %ebx
    2fba:	5e                   	pop    %esi
    2fbb:	5f                   	pop    %edi
    2fbc:	5d                   	pop    %ebp
    2fbd:	c3                   	ret    
    printf(stdout, "failed sbrk leaked memory\n");
    2fbe:	83 ec 08             	sub    $0x8,%esp
    2fc1:	68 39 4b 00 00       	push   $0x4b39
    2fc6:	ff 35 48 5d 00 00    	pushl  0x5d48
    2fcc:	e8 2b 0a 00 00       	call   39fc <printf>
    exit();
    2fd1:	e8 d5 08 00 00       	call   38ab <exit>
    sbrk(-(sbrk(0) - oldbrk));
    2fd6:	83 ec 0c             	sub    $0xc,%esp
    2fd9:	6a 00                	push   $0x0
    2fdb:	e8 53 09 00 00       	call   3933 <sbrk>
    2fe0:	29 c7                	sub    %eax,%edi
    2fe2:	89 3c 24             	mov    %edi,(%esp)
    2fe5:	e8 49 09 00 00       	call   3933 <sbrk>
    2fea:	83 c4 10             	add    $0x10,%esp
    2fed:	eb b1                	jmp    2fa0 <sbrktest+0x3cc>

00002fef <validateint>:

void
validateint(int *p)
{
    2fef:	f3 0f 1e fb          	endbr32 
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    2ff3:	c3                   	ret    

00002ff4 <validatetest>:

void
validatetest(void)
{
    2ff4:	f3 0f 1e fb          	endbr32 
    2ff8:	55                   	push   %ebp
    2ff9:	89 e5                	mov    %esp,%ebp
    2ffb:	56                   	push   %esi
    2ffc:	53                   	push   %ebx
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2ffd:	83 ec 08             	sub    $0x8,%esp
    3000:	68 62 4b 00 00       	push   $0x4b62
    3005:	ff 35 48 5d 00 00    	pushl  0x5d48
    300b:	e8 ec 09 00 00       	call   39fc <printf>
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3010:	83 c4 10             	add    $0x10,%esp
    3013:	be 00 00 00 00       	mov    $0x0,%esi
    3018:	eb 0b                	jmp    3025 <validatetest+0x31>
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    301a:	e8 8c 08 00 00       	call   38ab <exit>
  for(p = 0; p <= (uint)hi; p += 4096){
    301f:	81 c6 00 10 00 00    	add    $0x1000,%esi
    3025:	81 fe 00 30 11 00    	cmp    $0x113000,%esi
    302b:	77 5c                	ja     3089 <validatetest+0x95>
    if((pid = fork()) == 0){
    302d:	e8 71 08 00 00       	call   38a3 <fork>
    3032:	89 c3                	mov    %eax,%ebx
    3034:	85 c0                	test   %eax,%eax
    3036:	74 e2                	je     301a <validatetest+0x26>
    }
    sleep(0);
    3038:	83 ec 0c             	sub    $0xc,%esp
    303b:	6a 00                	push   $0x0
    303d:	e8 f9 08 00 00       	call   393b <sleep>
    sleep(0);
    3042:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3049:	e8 ed 08 00 00       	call   393b <sleep>
    kill(pid);
    304e:	89 1c 24             	mov    %ebx,(%esp)
    3051:	e8 85 08 00 00       	call   38db <kill>
    wait();
    3056:	e8 58 08 00 00       	call   38b3 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    305b:	83 c4 08             	add    $0x8,%esp
    305e:	56                   	push   %esi
    305f:	68 71 4b 00 00       	push   $0x4b71
    3064:	e8 a2 08 00 00       	call   390b <link>
    3069:	83 c4 10             	add    $0x10,%esp
    306c:	83 f8 ff             	cmp    $0xffffffff,%eax
    306f:	74 ae                	je     301f <validatetest+0x2b>
      printf(stdout, "link should not succeed\n");
    3071:	83 ec 08             	sub    $0x8,%esp
    3074:	68 7c 4b 00 00       	push   $0x4b7c
    3079:	ff 35 48 5d 00 00    	pushl  0x5d48
    307f:	e8 78 09 00 00       	call   39fc <printf>
      exit();
    3084:	e8 22 08 00 00       	call   38ab <exit>
    }
  }

  printf(stdout, "validate ok\n");
    3089:	83 ec 08             	sub    $0x8,%esp
    308c:	68 95 4b 00 00       	push   $0x4b95
    3091:	ff 35 48 5d 00 00    	pushl  0x5d48
    3097:	e8 60 09 00 00       	call   39fc <printf>
}
    309c:	83 c4 10             	add    $0x10,%esp
    309f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    30a2:	5b                   	pop    %ebx
    30a3:	5e                   	pop    %esi
    30a4:	5d                   	pop    %ebp
    30a5:	c3                   	ret    

000030a6 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    30a6:	f3 0f 1e fb          	endbr32 
    30aa:	55                   	push   %ebp
    30ab:	89 e5                	mov    %esp,%ebp
    30ad:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    30b0:	68 a2 4b 00 00       	push   $0x4ba2
    30b5:	ff 35 48 5d 00 00    	pushl  0x5d48
    30bb:	e8 3c 09 00 00       	call   39fc <printf>
  for(i = 0; i < sizeof(uninit); i++){
    30c0:	83 c4 10             	add    $0x10,%esp
    30c3:	b8 00 00 00 00       	mov    $0x0,%eax
    30c8:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    30cd:	77 26                	ja     30f5 <bsstest+0x4f>
    if(uninit[i] != '\0'){
    30cf:	80 b8 00 5e 00 00 00 	cmpb   $0x0,0x5e00(%eax)
    30d6:	75 05                	jne    30dd <bsstest+0x37>
  for(i = 0; i < sizeof(uninit); i++){
    30d8:	83 c0 01             	add    $0x1,%eax
    30db:	eb eb                	jmp    30c8 <bsstest+0x22>
      printf(stdout, "bss test failed\n");
    30dd:	83 ec 08             	sub    $0x8,%esp
    30e0:	68 ac 4b 00 00       	push   $0x4bac
    30e5:	ff 35 48 5d 00 00    	pushl  0x5d48
    30eb:	e8 0c 09 00 00       	call   39fc <printf>
      exit();
    30f0:	e8 b6 07 00 00       	call   38ab <exit>
    }
  }
  printf(stdout, "bss test ok\n");
    30f5:	83 ec 08             	sub    $0x8,%esp
    30f8:	68 bd 4b 00 00       	push   $0x4bbd
    30fd:	ff 35 48 5d 00 00    	pushl  0x5d48
    3103:	e8 f4 08 00 00       	call   39fc <printf>
}
    3108:	83 c4 10             	add    $0x10,%esp
    310b:	c9                   	leave  
    310c:	c3                   	ret    

0000310d <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    310d:	f3 0f 1e fb          	endbr32 
    3111:	55                   	push   %ebp
    3112:	89 e5                	mov    %esp,%ebp
    3114:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3117:	68 ca 4b 00 00       	push   $0x4bca
    311c:	e8 da 07 00 00       	call   38fb <unlink>
  pid = fork();
    3121:	e8 7d 07 00 00       	call   38a3 <fork>
  if(pid == 0){
    3126:	83 c4 10             	add    $0x10,%esp
    3129:	85 c0                	test   %eax,%eax
    312b:	74 4d                	je     317a <bigargtest+0x6d>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    312d:	0f 88 ad 00 00 00    	js     31e0 <bigargtest+0xd3>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    3133:	e8 7b 07 00 00       	call   38b3 <wait>
  fd = open("bigarg-ok", 0);
    3138:	83 ec 08             	sub    $0x8,%esp
    313b:	6a 00                	push   $0x0
    313d:	68 ca 4b 00 00       	push   $0x4bca
    3142:	e8 a4 07 00 00       	call   38eb <open>
  if(fd < 0){
    3147:	83 c4 10             	add    $0x10,%esp
    314a:	85 c0                	test   %eax,%eax
    314c:	0f 88 a6 00 00 00    	js     31f8 <bigargtest+0xeb>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    3152:	83 ec 0c             	sub    $0xc,%esp
    3155:	50                   	push   %eax
    3156:	e8 78 07 00 00       	call   38d3 <close>
  unlink("bigarg-ok");
    315b:	c7 04 24 ca 4b 00 00 	movl   $0x4bca,(%esp)
    3162:	e8 94 07 00 00       	call   38fb <unlink>
}
    3167:	83 c4 10             	add    $0x10,%esp
    316a:	c9                   	leave  
    316b:	c3                   	ret    
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    316c:	c7 04 85 60 5d 00 00 	movl   $0x5324,0x5d60(,%eax,4)
    3173:	24 53 00 00 
    for(i = 0; i < MAXARG-1; i++)
    3177:	83 c0 01             	add    $0x1,%eax
    317a:	83 f8 1e             	cmp    $0x1e,%eax
    317d:	7e ed                	jle    316c <bigargtest+0x5f>
    args[MAXARG-1] = 0;
    317f:	c7 05 dc 5d 00 00 00 	movl   $0x0,0x5ddc
    3186:	00 00 00 
    printf(stdout, "bigarg test\n");
    3189:	83 ec 08             	sub    $0x8,%esp
    318c:	68 d4 4b 00 00       	push   $0x4bd4
    3191:	ff 35 48 5d 00 00    	pushl  0x5d48
    3197:	e8 60 08 00 00       	call   39fc <printf>
    exec("echo", args);
    319c:	83 c4 08             	add    $0x8,%esp
    319f:	68 60 5d 00 00       	push   $0x5d60
    31a4:	68 a1 3d 00 00       	push   $0x3da1
    31a9:	e8 35 07 00 00       	call   38e3 <exec>
    printf(stdout, "bigarg test ok\n");
    31ae:	83 c4 08             	add    $0x8,%esp
    31b1:	68 e1 4b 00 00       	push   $0x4be1
    31b6:	ff 35 48 5d 00 00    	pushl  0x5d48
    31bc:	e8 3b 08 00 00       	call   39fc <printf>
    fd = open("bigarg-ok", O_CREATE);
    31c1:	83 c4 08             	add    $0x8,%esp
    31c4:	68 00 02 00 00       	push   $0x200
    31c9:	68 ca 4b 00 00       	push   $0x4bca
    31ce:	e8 18 07 00 00       	call   38eb <open>
    close(fd);
    31d3:	89 04 24             	mov    %eax,(%esp)
    31d6:	e8 f8 06 00 00       	call   38d3 <close>
    exit();
    31db:	e8 cb 06 00 00       	call   38ab <exit>
    printf(stdout, "bigargtest: fork failed\n");
    31e0:	83 ec 08             	sub    $0x8,%esp
    31e3:	68 f1 4b 00 00       	push   $0x4bf1
    31e8:	ff 35 48 5d 00 00    	pushl  0x5d48
    31ee:	e8 09 08 00 00       	call   39fc <printf>
    exit();
    31f3:	e8 b3 06 00 00       	call   38ab <exit>
    printf(stdout, "bigarg test failed!\n");
    31f8:	83 ec 08             	sub    $0x8,%esp
    31fb:	68 0a 4c 00 00       	push   $0x4c0a
    3200:	ff 35 48 5d 00 00    	pushl  0x5d48
    3206:	e8 f1 07 00 00       	call   39fc <printf>
    exit();
    320b:	e8 9b 06 00 00       	call   38ab <exit>

00003210 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3210:	f3 0f 1e fb          	endbr32 
    3214:	55                   	push   %ebp
    3215:	89 e5                	mov    %esp,%ebp
    3217:	57                   	push   %edi
    3218:	56                   	push   %esi
    3219:	53                   	push   %ebx
    321a:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    321d:	68 1f 4c 00 00       	push   $0x4c1f
    3222:	6a 01                	push   $0x1
    3224:	e8 d3 07 00 00       	call   39fc <printf>
    3229:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    322c:	bb 00 00 00 00       	mov    $0x0,%ebx
    char name[64];
    name[0] = 'f';
    3231:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3235:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    323a:	89 d8                	mov    %ebx,%eax
    323c:	f7 ea                	imul   %edx
    323e:	c1 fa 06             	sar    $0x6,%edx
    3241:	89 df                	mov    %ebx,%edi
    3243:	c1 ff 1f             	sar    $0x1f,%edi
    3246:	29 fa                	sub    %edi,%edx
    3248:	8d 42 30             	lea    0x30(%edx),%eax
    324b:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    324e:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    3254:	89 de                	mov    %ebx,%esi
    3256:	29 d6                	sub    %edx,%esi
    3258:	b9 1f 85 eb 51       	mov    $0x51eb851f,%ecx
    325d:	89 f0                	mov    %esi,%eax
    325f:	f7 e9                	imul   %ecx
    3261:	c1 fa 05             	sar    $0x5,%edx
    3264:	c1 fe 1f             	sar    $0x1f,%esi
    3267:	29 f2                	sub    %esi,%edx
    3269:	83 c2 30             	add    $0x30,%edx
    326c:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    326f:	89 d8                	mov    %ebx,%eax
    3271:	f7 e9                	imul   %ecx
    3273:	89 d1                	mov    %edx,%ecx
    3275:	c1 f9 05             	sar    $0x5,%ecx
    3278:	29 f9                	sub    %edi,%ecx
    327a:	6b c9 64             	imul   $0x64,%ecx,%ecx
    327d:	89 d8                	mov    %ebx,%eax
    327f:	29 c8                	sub    %ecx,%eax
    3281:	89 c1                	mov    %eax,%ecx
    3283:	be 67 66 66 66       	mov    $0x66666667,%esi
    3288:	f7 ee                	imul   %esi
    328a:	c1 fa 02             	sar    $0x2,%edx
    328d:	c1 f9 1f             	sar    $0x1f,%ecx
    3290:	29 ca                	sub    %ecx,%edx
    3292:	83 c2 30             	add    $0x30,%edx
    3295:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3298:	89 d8                	mov    %ebx,%eax
    329a:	f7 ee                	imul   %esi
    329c:	c1 fa 02             	sar    $0x2,%edx
    329f:	29 fa                	sub    %edi,%edx
    32a1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    32a4:	01 c0                	add    %eax,%eax
    32a6:	89 da                	mov    %ebx,%edx
    32a8:	29 c2                	sub    %eax,%edx
    32aa:	83 c2 30             	add    $0x30,%edx
    32ad:	88 55 ac             	mov    %dl,-0x54(%ebp)
    name[5] = '\0';
    32b0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    printf(1, "writing %s\n", name);
    32b4:	83 ec 04             	sub    $0x4,%esp
    32b7:	8d 75 a8             	lea    -0x58(%ebp),%esi
    32ba:	56                   	push   %esi
    32bb:	68 2c 4c 00 00       	push   $0x4c2c
    32c0:	6a 01                	push   $0x1
    32c2:	e8 35 07 00 00       	call   39fc <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    32c7:	83 c4 08             	add    $0x8,%esp
    32ca:	68 02 02 00 00       	push   $0x202
    32cf:	56                   	push   %esi
    32d0:	e8 16 06 00 00       	call   38eb <open>
    32d5:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    32d7:	83 c4 10             	add    $0x10,%esp
    32da:	85 c0                	test   %eax,%eax
    32dc:	79 1b                	jns    32f9 <fsfull+0xe9>
      printf(1, "open %s failed\n", name);
    32de:	83 ec 04             	sub    $0x4,%esp
    32e1:	8d 45 a8             	lea    -0x58(%ebp),%eax
    32e4:	50                   	push   %eax
    32e5:	68 38 4c 00 00       	push   $0x4c38
    32ea:	6a 01                	push   $0x1
    32ec:	e8 0b 07 00 00       	call   39fc <printf>
      break;
    32f1:	83 c4 10             	add    $0x10,%esp
    32f4:	e9 e6 00 00 00       	jmp    33df <fsfull+0x1cf>
    }
    int total = 0;
    32f9:	bf 00 00 00 00       	mov    $0x0,%edi
    while(1){
      int cc = write(fd, buf, 512);
    32fe:	83 ec 04             	sub    $0x4,%esp
    3301:	68 00 02 00 00       	push   $0x200
    3306:	68 20 85 00 00       	push   $0x8520
    330b:	56                   	push   %esi
    330c:	e8 ba 05 00 00       	call   38cb <write>
      if(cc < 512)
    3311:	83 c4 10             	add    $0x10,%esp
    3314:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3319:	7e 04                	jle    331f <fsfull+0x10f>
        break;
      total += cc;
    331b:	01 c7                	add    %eax,%edi
    while(1){
    331d:	eb df                	jmp    32fe <fsfull+0xee>
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    331f:	83 ec 04             	sub    $0x4,%esp
    3322:	57                   	push   %edi
    3323:	68 48 4c 00 00       	push   $0x4c48
    3328:	6a 01                	push   $0x1
    332a:	e8 cd 06 00 00       	call   39fc <printf>
    close(fd);
    332f:	89 34 24             	mov    %esi,(%esp)
    3332:	e8 9c 05 00 00       	call   38d3 <close>
    if(total == 0)
    3337:	83 c4 10             	add    $0x10,%esp
    333a:	85 ff                	test   %edi,%edi
    333c:	0f 84 9d 00 00 00    	je     33df <fsfull+0x1cf>
  for(nfiles = 0; ; nfiles++){
    3342:	83 c3 01             	add    $0x1,%ebx
    3345:	e9 e7 fe ff ff       	jmp    3231 <fsfull+0x21>
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    334a:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    334e:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3353:	89 d8                	mov    %ebx,%eax
    3355:	f7 ea                	imul   %edx
    3357:	c1 fa 06             	sar    $0x6,%edx
    335a:	89 df                	mov    %ebx,%edi
    335c:	c1 ff 1f             	sar    $0x1f,%edi
    335f:	29 fa                	sub    %edi,%edx
    3361:	8d 42 30             	lea    0x30(%edx),%eax
    3364:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3367:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    336d:	89 de                	mov    %ebx,%esi
    336f:	29 d6                	sub    %edx,%esi
    3371:	b9 1f 85 eb 51       	mov    $0x51eb851f,%ecx
    3376:	89 f0                	mov    %esi,%eax
    3378:	f7 e9                	imul   %ecx
    337a:	c1 fa 05             	sar    $0x5,%edx
    337d:	c1 fe 1f             	sar    $0x1f,%esi
    3380:	29 f2                	sub    %esi,%edx
    3382:	83 c2 30             	add    $0x30,%edx
    3385:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3388:	89 d8                	mov    %ebx,%eax
    338a:	f7 e9                	imul   %ecx
    338c:	89 d1                	mov    %edx,%ecx
    338e:	c1 f9 05             	sar    $0x5,%ecx
    3391:	29 f9                	sub    %edi,%ecx
    3393:	6b c9 64             	imul   $0x64,%ecx,%ecx
    3396:	89 d8                	mov    %ebx,%eax
    3398:	29 c8                	sub    %ecx,%eax
    339a:	89 c1                	mov    %eax,%ecx
    339c:	be 67 66 66 66       	mov    $0x66666667,%esi
    33a1:	f7 ee                	imul   %esi
    33a3:	c1 fa 02             	sar    $0x2,%edx
    33a6:	c1 f9 1f             	sar    $0x1f,%ecx
    33a9:	29 ca                	sub    %ecx,%edx
    33ab:	83 c2 30             	add    $0x30,%edx
    33ae:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    33b1:	89 d8                	mov    %ebx,%eax
    33b3:	f7 ee                	imul   %esi
    33b5:	c1 fa 02             	sar    $0x2,%edx
    33b8:	29 fa                	sub    %edi,%edx
    33ba:	8d 04 92             	lea    (%edx,%edx,4),%eax
    33bd:	01 c0                	add    %eax,%eax
    33bf:	89 da                	mov    %ebx,%edx
    33c1:	29 c2                	sub    %eax,%edx
    33c3:	83 c2 30             	add    $0x30,%edx
    33c6:	88 55 ac             	mov    %dl,-0x54(%ebp)
    name[5] = '\0';
    33c9:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    unlink(name);
    33cd:	83 ec 0c             	sub    $0xc,%esp
    33d0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    33d3:	50                   	push   %eax
    33d4:	e8 22 05 00 00       	call   38fb <unlink>
    nfiles--;
    33d9:	83 eb 01             	sub    $0x1,%ebx
    33dc:	83 c4 10             	add    $0x10,%esp
  while(nfiles >= 0){
    33df:	85 db                	test   %ebx,%ebx
    33e1:	0f 89 63 ff ff ff    	jns    334a <fsfull+0x13a>
  }

  printf(1, "fsfull test finished\n");
    33e7:	83 ec 08             	sub    $0x8,%esp
    33ea:	68 58 4c 00 00       	push   $0x4c58
    33ef:	6a 01                	push   $0x1
    33f1:	e8 06 06 00 00       	call   39fc <printf>
}
    33f6:	83 c4 10             	add    $0x10,%esp
    33f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    33fc:	5b                   	pop    %ebx
    33fd:	5e                   	pop    %esi
    33fe:	5f                   	pop    %edi
    33ff:	5d                   	pop    %ebp
    3400:	c3                   	ret    

00003401 <uio>:

void
uio()
{
    3401:	f3 0f 1e fb          	endbr32 
    3405:	55                   	push   %ebp
    3406:	89 e5                	mov    %esp,%ebp
    3408:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    340b:	68 6e 4c 00 00       	push   $0x4c6e
    3410:	6a 01                	push   $0x1
    3412:	e8 e5 05 00 00       	call   39fc <printf>
  pid = fork();
    3417:	e8 87 04 00 00       	call   38a3 <fork>
  if(pid == 0){
    341c:	83 c4 10             	add    $0x10,%esp
    341f:	85 c0                	test   %eax,%eax
    3421:	74 1b                	je     343e <uio+0x3d>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    3423:	78 3e                	js     3463 <uio+0x62>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    3425:	e8 89 04 00 00       	call   38b3 <wait>
  printf(1, "uio test done\n");
    342a:	83 ec 08             	sub    $0x8,%esp
    342d:	68 78 4c 00 00       	push   $0x4c78
    3432:	6a 01                	push   $0x1
    3434:	e8 c3 05 00 00       	call   39fc <printf>
}
    3439:	83 c4 10             	add    $0x10,%esp
    343c:	c9                   	leave  
    343d:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    343e:	b8 09 00 00 00       	mov    $0x9,%eax
    3443:	ba 70 00 00 00       	mov    $0x70,%edx
    3448:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3449:	ba 71 00 00 00       	mov    $0x71,%edx
    344e:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    344f:	83 ec 08             	sub    $0x8,%esp
    3452:	68 04 54 00 00       	push   $0x5404
    3457:	6a 01                	push   $0x1
    3459:	e8 9e 05 00 00       	call   39fc <printf>
    exit();
    345e:	e8 48 04 00 00       	call   38ab <exit>
    printf (1, "fork failed\n");
    3463:	83 ec 08             	sub    $0x8,%esp
    3466:	68 fd 4b 00 00       	push   $0x4bfd
    346b:	6a 01                	push   $0x1
    346d:	e8 8a 05 00 00       	call   39fc <printf>
    exit();
    3472:	e8 34 04 00 00       	call   38ab <exit>

00003477 <argptest>:

void argptest()
{
    3477:	f3 0f 1e fb          	endbr32 
    347b:	55                   	push   %ebp
    347c:	89 e5                	mov    %esp,%ebp
    347e:	53                   	push   %ebx
    347f:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    3482:	6a 00                	push   $0x0
    3484:	68 87 4c 00 00       	push   $0x4c87
    3489:	e8 5d 04 00 00       	call   38eb <open>
  if (fd < 0) {
    348e:	83 c4 10             	add    $0x10,%esp
    3491:	85 c0                	test   %eax,%eax
    3493:	78 3a                	js     34cf <argptest+0x58>
    3495:	89 c3                	mov    %eax,%ebx
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    3497:	83 ec 0c             	sub    $0xc,%esp
    349a:	6a 00                	push   $0x0
    349c:	e8 92 04 00 00       	call   3933 <sbrk>
    34a1:	83 e8 01             	sub    $0x1,%eax
    34a4:	83 c4 0c             	add    $0xc,%esp
    34a7:	6a ff                	push   $0xffffffff
    34a9:	50                   	push   %eax
    34aa:	53                   	push   %ebx
    34ab:	e8 13 04 00 00       	call   38c3 <read>
  close(fd);
    34b0:	89 1c 24             	mov    %ebx,(%esp)
    34b3:	e8 1b 04 00 00       	call   38d3 <close>
  printf(1, "arg test passed\n");
    34b8:	83 c4 08             	add    $0x8,%esp
    34bb:	68 99 4c 00 00       	push   $0x4c99
    34c0:	6a 01                	push   $0x1
    34c2:	e8 35 05 00 00       	call   39fc <printf>
}
    34c7:	83 c4 10             	add    $0x10,%esp
    34ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    34cd:	c9                   	leave  
    34ce:	c3                   	ret    
    printf(2, "open failed\n");
    34cf:	83 ec 08             	sub    $0x8,%esp
    34d2:	68 8c 4c 00 00       	push   $0x4c8c
    34d7:	6a 02                	push   $0x2
    34d9:	e8 1e 05 00 00       	call   39fc <printf>
    exit();
    34de:	e8 c8 03 00 00       	call   38ab <exit>

000034e3 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    34e3:	f3 0f 1e fb          	endbr32 
  randstate = randstate * 1664525 + 1013904223;
    34e7:	69 05 44 5d 00 00 0d 	imul   $0x19660d,0x5d44,%eax
    34ee:	66 19 00 
    34f1:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    34f6:	a3 44 5d 00 00       	mov    %eax,0x5d44
  return randstate;
}
    34fb:	c3                   	ret    

000034fc <main>:

int
main(int argc, char *argv[])
{
    34fc:	f3 0f 1e fb          	endbr32 
    3500:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3504:	83 e4 f0             	and    $0xfffffff0,%esp
    3507:	ff 71 fc             	pushl  -0x4(%ecx)
    350a:	55                   	push   %ebp
    350b:	89 e5                	mov    %esp,%ebp
    350d:	51                   	push   %ecx
    350e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
    3511:	68 aa 4c 00 00       	push   $0x4caa
    3516:	6a 01                	push   $0x1
    3518:	e8 df 04 00 00       	call   39fc <printf>

  if(open("usertests.ran", 0) >= 0){
    351d:	83 c4 08             	add    $0x8,%esp
    3520:	6a 00                	push   $0x0
    3522:	68 be 4c 00 00       	push   $0x4cbe
    3527:	e8 bf 03 00 00       	call   38eb <open>
    352c:	83 c4 10             	add    $0x10,%esp
    352f:	85 c0                	test   %eax,%eax
    3531:	78 14                	js     3547 <main+0x4b>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3533:	83 ec 08             	sub    $0x8,%esp
    3536:	68 28 54 00 00       	push   $0x5428
    353b:	6a 01                	push   $0x1
    353d:	e8 ba 04 00 00       	call   39fc <printf>
    exit();
    3542:	e8 64 03 00 00       	call   38ab <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3547:	83 ec 08             	sub    $0x8,%esp
    354a:	68 00 02 00 00       	push   $0x200
    354f:	68 be 4c 00 00       	push   $0x4cbe
    3554:	e8 92 03 00 00       	call   38eb <open>
    3559:	89 04 24             	mov    %eax,(%esp)
    355c:	e8 72 03 00 00       	call   38d3 <close>

  argptest();
    3561:	e8 11 ff ff ff       	call   3477 <argptest>
  createdelete();
    3566:	e8 de da ff ff       	call   1049 <createdelete>
  linkunlink();
    356b:	e8 8b e3 ff ff       	call   18fb <linkunlink>
  concreate();
    3570:	e8 94 e0 ff ff       	call   1609 <concreate>
  fourfiles();
    3575:	e8 e8 d8 ff ff       	call   e62 <fourfiles>
  sharedfd();
    357a:	e8 42 d7 ff ff       	call   cc1 <sharedfd>

  bigargtest();
    357f:	e8 89 fb ff ff       	call   310d <bigargtest>
  bigwrite();
    3584:	e8 f4 ec ff ff       	call   227d <bigwrite>
  bigargtest();
    3589:	e8 7f fb ff ff       	call   310d <bigargtest>
  bsstest();
    358e:	e8 13 fb ff ff       	call   30a6 <bsstest>
  sbrktest();
    3593:	e8 3c f6 ff ff       	call   2bd4 <sbrktest>
  validatetest();
    3598:	e8 57 fa ff ff       	call   2ff4 <validatetest>

  opentest();
    359d:	e8 16 cd ff ff       	call   2b8 <opentest>
  writetest();
    35a2:	e8 a8 cd ff ff       	call   34f <writetest>
  writetest1();
    35a7:	e8 6f cf ff ff       	call   51b <writetest1>
  createtest();
    35ac:	e8 1e d1 ff ff       	call   6cf <createtest>

  openiputtest();
    35b1:	e8 15 cc ff ff       	call   1cb <openiputtest>
  exitiputtest();
    35b6:	e8 26 cb ff ff       	call   e1 <exitiputtest>
  iputtest();
    35bb:	e8 40 ca ff ff       	call   0 <iputtest>

  mem();
    35c0:	e8 3f d6 ff ff       	call   c04 <mem>
  pipe1();
    35c5:	e8 e3 d2 ff ff       	call   8ad <pipe1>
  preempt();
    35ca:	e8 82 d4 ff ff       	call   a51 <preempt>
  exitwait();
    35cf:	e8 bc d5 ff ff       	call   b90 <exitwait>

  rmdot();
    35d4:	e8 75 f0 ff ff       	call   264e <rmdot>
  fourteen();
    35d9:	e8 2f ef ff ff       	call   250d <fourteen>
  bigfile();
    35de:	e8 70 ed ff ff       	call   2353 <bigfile>
  subdir();
    35e3:	e8 63 e5 ff ff       	call   1b4b <subdir>
  linktest();
    35e8:	e8 f2 dd ff ff       	call   13df <linktest>
  unlinkread();
    35ed:	e8 50 dc ff ff       	call   1242 <unlinkread>
  dirfile();
    35f2:	e8 e0 f1 ff ff       	call   27d7 <dirfile>
  iref();
    35f7:	e8 f9 f3 ff ff       	call   29f5 <iref>
  forktest();
    35fc:	e8 20 f5 ff ff       	call   2b21 <forktest>
  bigdir(); // slow
    3601:	e8 ed e3 ff ff       	call   19f3 <bigdir>

  uio();
    3606:	e8 f6 fd ff ff       	call   3401 <uio>

  exectest();
    360b:	e8 50 d2 ff ff       	call   860 <exectest>

  exit();
    3610:	e8 96 02 00 00       	call   38ab <exit>

00003615 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3615:	f3 0f 1e fb          	endbr32 
    3619:	55                   	push   %ebp
    361a:	89 e5                	mov    %esp,%ebp
    361c:	56                   	push   %esi
    361d:	53                   	push   %ebx
    361e:	8b 75 08             	mov    0x8(%ebp),%esi
    3621:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3624:	89 f0                	mov    %esi,%eax
    3626:	89 d1                	mov    %edx,%ecx
    3628:	83 c2 01             	add    $0x1,%edx
    362b:	89 c3                	mov    %eax,%ebx
    362d:	83 c0 01             	add    $0x1,%eax
    3630:	0f b6 09             	movzbl (%ecx),%ecx
    3633:	88 0b                	mov    %cl,(%ebx)
    3635:	84 c9                	test   %cl,%cl
    3637:	75 ed                	jne    3626 <strcpy+0x11>
    ;
  return os;
}
    3639:	89 f0                	mov    %esi,%eax
    363b:	5b                   	pop    %ebx
    363c:	5e                   	pop    %esi
    363d:	5d                   	pop    %ebp
    363e:	c3                   	ret    

0000363f <strcmp>:

int
strcmp(const char *p, const char *q)
{
    363f:	f3 0f 1e fb          	endbr32 
    3643:	55                   	push   %ebp
    3644:	89 e5                	mov    %esp,%ebp
    3646:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3649:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    364c:	0f b6 01             	movzbl (%ecx),%eax
    364f:	84 c0                	test   %al,%al
    3651:	74 0c                	je     365f <strcmp+0x20>
    3653:	3a 02                	cmp    (%edx),%al
    3655:	75 08                	jne    365f <strcmp+0x20>
    p++, q++;
    3657:	83 c1 01             	add    $0x1,%ecx
    365a:	83 c2 01             	add    $0x1,%edx
    365d:	eb ed                	jmp    364c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
    365f:	0f b6 c0             	movzbl %al,%eax
    3662:	0f b6 12             	movzbl (%edx),%edx
    3665:	29 d0                	sub    %edx,%eax
}
    3667:	5d                   	pop    %ebp
    3668:	c3                   	ret    

00003669 <strlen>:

uint
strlen(char *s)
{
    3669:	f3 0f 1e fb          	endbr32 
    366d:	55                   	push   %ebp
    366e:	89 e5                	mov    %esp,%ebp
    3670:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3673:	b8 00 00 00 00       	mov    $0x0,%eax
    3678:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    367c:	74 05                	je     3683 <strlen+0x1a>
    367e:	83 c0 01             	add    $0x1,%eax
    3681:	eb f5                	jmp    3678 <strlen+0xf>
    ;
  return n;
}
    3683:	5d                   	pop    %ebp
    3684:	c3                   	ret    

00003685 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3685:	f3 0f 1e fb          	endbr32 
    3689:	55                   	push   %ebp
    368a:	89 e5                	mov    %esp,%ebp
    368c:	57                   	push   %edi
    368d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3690:	89 d7                	mov    %edx,%edi
    3692:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3695:	8b 45 0c             	mov    0xc(%ebp),%eax
    3698:	fc                   	cld    
    3699:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    369b:	89 d0                	mov    %edx,%eax
    369d:	5f                   	pop    %edi
    369e:	5d                   	pop    %ebp
    369f:	c3                   	ret    

000036a0 <strchr>:

char*
strchr(const char *s, char c)
{
    36a0:	f3 0f 1e fb          	endbr32 
    36a4:	55                   	push   %ebp
    36a5:	89 e5                	mov    %esp,%ebp
    36a7:	8b 45 08             	mov    0x8(%ebp),%eax
    36aa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    36ae:	0f b6 10             	movzbl (%eax),%edx
    36b1:	84 d2                	test   %dl,%dl
    36b3:	74 09                	je     36be <strchr+0x1e>
    if(*s == c)
    36b5:	38 ca                	cmp    %cl,%dl
    36b7:	74 0a                	je     36c3 <strchr+0x23>
  for(; *s; s++)
    36b9:	83 c0 01             	add    $0x1,%eax
    36bc:	eb f0                	jmp    36ae <strchr+0xe>
      return (char*)s;
  return 0;
    36be:	b8 00 00 00 00       	mov    $0x0,%eax
}
    36c3:	5d                   	pop    %ebp
    36c4:	c3                   	ret    

000036c5 <gets>:

char*
gets(char *buf, int max)
{
    36c5:	f3 0f 1e fb          	endbr32 
    36c9:	55                   	push   %ebp
    36ca:	89 e5                	mov    %esp,%ebp
    36cc:	57                   	push   %edi
    36cd:	56                   	push   %esi
    36ce:	53                   	push   %ebx
    36cf:	83 ec 1c             	sub    $0x1c,%esp
    36d2:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    36d5:	bb 00 00 00 00       	mov    $0x0,%ebx
    36da:	89 de                	mov    %ebx,%esi
    36dc:	83 c3 01             	add    $0x1,%ebx
    36df:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    36e2:	7d 2e                	jge    3712 <gets+0x4d>
    cc = read(0, &c, 1);
    36e4:	83 ec 04             	sub    $0x4,%esp
    36e7:	6a 01                	push   $0x1
    36e9:	8d 45 e7             	lea    -0x19(%ebp),%eax
    36ec:	50                   	push   %eax
    36ed:	6a 00                	push   $0x0
    36ef:	e8 cf 01 00 00       	call   38c3 <read>
    if(cc < 1)
    36f4:	83 c4 10             	add    $0x10,%esp
    36f7:	85 c0                	test   %eax,%eax
    36f9:	7e 17                	jle    3712 <gets+0x4d>
      break;
    buf[i++] = c;
    36fb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    36ff:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    3702:	3c 0a                	cmp    $0xa,%al
    3704:	0f 94 c2             	sete   %dl
    3707:	3c 0d                	cmp    $0xd,%al
    3709:	0f 94 c0             	sete   %al
    370c:	08 c2                	or     %al,%dl
    370e:	74 ca                	je     36da <gets+0x15>
    buf[i++] = c;
    3710:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    3712:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    3716:	89 f8                	mov    %edi,%eax
    3718:	8d 65 f4             	lea    -0xc(%ebp),%esp
    371b:	5b                   	pop    %ebx
    371c:	5e                   	pop    %esi
    371d:	5f                   	pop    %edi
    371e:	5d                   	pop    %ebp
    371f:	c3                   	ret    

00003720 <stat>:

int
stat(char *n, struct stat *st)
{
    3720:	f3 0f 1e fb          	endbr32 
    3724:	55                   	push   %ebp
    3725:	89 e5                	mov    %esp,%ebp
    3727:	56                   	push   %esi
    3728:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3729:	83 ec 08             	sub    $0x8,%esp
    372c:	6a 00                	push   $0x0
    372e:	ff 75 08             	pushl  0x8(%ebp)
    3731:	e8 b5 01 00 00       	call   38eb <open>
  if(fd < 0)
    3736:	83 c4 10             	add    $0x10,%esp
    3739:	85 c0                	test   %eax,%eax
    373b:	78 24                	js     3761 <stat+0x41>
    373d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    373f:	83 ec 08             	sub    $0x8,%esp
    3742:	ff 75 0c             	pushl  0xc(%ebp)
    3745:	50                   	push   %eax
    3746:	e8 b8 01 00 00       	call   3903 <fstat>
    374b:	89 c6                	mov    %eax,%esi
  close(fd);
    374d:	89 1c 24             	mov    %ebx,(%esp)
    3750:	e8 7e 01 00 00       	call   38d3 <close>
  return r;
    3755:	83 c4 10             	add    $0x10,%esp
}
    3758:	89 f0                	mov    %esi,%eax
    375a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    375d:	5b                   	pop    %ebx
    375e:	5e                   	pop    %esi
    375f:	5d                   	pop    %ebp
    3760:	c3                   	ret    
    return -1;
    3761:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3766:	eb f0                	jmp    3758 <stat+0x38>

00003768 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
    3768:	f3 0f 1e fb          	endbr32 
    376c:	55                   	push   %ebp
    376d:	89 e5                	mov    %esp,%ebp
    376f:	57                   	push   %edi
    3770:	56                   	push   %esi
    3771:	53                   	push   %ebx
    3772:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
    3775:	0f b6 02             	movzbl (%edx),%eax
    3778:	3c 20                	cmp    $0x20,%al
    377a:	75 05                	jne    3781 <atoi+0x19>
    377c:	83 c2 01             	add    $0x1,%edx
    377f:	eb f4                	jmp    3775 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
    3781:	3c 2d                	cmp    $0x2d,%al
    3783:	74 1d                	je     37a2 <atoi+0x3a>
    3785:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
    378a:	3c 2b                	cmp    $0x2b,%al
    378c:	0f 94 c1             	sete   %cl
    378f:	3c 2d                	cmp    $0x2d,%al
    3791:	0f 94 c0             	sete   %al
    3794:	08 c1                	or     %al,%cl
    3796:	74 03                	je     379b <atoi+0x33>
    s++;
    3798:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
    379b:	b8 00 00 00 00       	mov    $0x0,%eax
    37a0:	eb 17                	jmp    37b9 <atoi+0x51>
    37a2:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    37a7:	eb e1                	jmp    378a <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
    37a9:	8d 34 80             	lea    (%eax,%eax,4),%esi
    37ac:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
    37af:	83 c2 01             	add    $0x1,%edx
    37b2:	0f be c9             	movsbl %cl,%ecx
    37b5:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
    37b9:	0f b6 0a             	movzbl (%edx),%ecx
    37bc:	8d 59 d0             	lea    -0x30(%ecx),%ebx
    37bf:	80 fb 09             	cmp    $0x9,%bl
    37c2:	76 e5                	jbe    37a9 <atoi+0x41>
  return sign*n;
    37c4:	0f af c7             	imul   %edi,%eax
}
    37c7:	5b                   	pop    %ebx
    37c8:	5e                   	pop    %esi
    37c9:	5f                   	pop    %edi
    37ca:	5d                   	pop    %ebp
    37cb:	c3                   	ret    

000037cc <atoo>:

int
atoo(const char *s)
{
    37cc:	f3 0f 1e fb          	endbr32 
    37d0:	55                   	push   %ebp
    37d1:	89 e5                	mov    %esp,%ebp
    37d3:	57                   	push   %edi
    37d4:	56                   	push   %esi
    37d5:	53                   	push   %ebx
    37d6:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
    37d9:	0f b6 0a             	movzbl (%edx),%ecx
    37dc:	80 f9 20             	cmp    $0x20,%cl
    37df:	75 05                	jne    37e6 <atoo+0x1a>
    37e1:	83 c2 01             	add    $0x1,%edx
    37e4:	eb f3                	jmp    37d9 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
    37e6:	80 f9 2d             	cmp    $0x2d,%cl
    37e9:	74 23                	je     380e <atoo+0x42>
    37eb:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
    37f0:	80 f9 2b             	cmp    $0x2b,%cl
    37f3:	0f 94 c0             	sete   %al
    37f6:	89 c6                	mov    %eax,%esi
    37f8:	80 f9 2d             	cmp    $0x2d,%cl
    37fb:	0f 94 c0             	sete   %al
    37fe:	89 f3                	mov    %esi,%ebx
    3800:	08 c3                	or     %al,%bl
    3802:	74 03                	je     3807 <atoo+0x3b>
    s++;
    3804:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
    3807:	b8 00 00 00 00       	mov    $0x0,%eax
    380c:	eb 11                	jmp    381f <atoo+0x53>
    380e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    3813:	eb db                	jmp    37f0 <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
    3815:	83 c2 01             	add    $0x1,%edx
    3818:	0f be c9             	movsbl %cl,%ecx
    381b:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
    381f:	0f b6 0a             	movzbl (%edx),%ecx
    3822:	8d 59 d0             	lea    -0x30(%ecx),%ebx
    3825:	80 fb 07             	cmp    $0x7,%bl
    3828:	76 eb                	jbe    3815 <atoo+0x49>
  return sign*n;
    382a:	0f af c7             	imul   %edi,%eax
}
    382d:	5b                   	pop    %ebx
    382e:	5e                   	pop    %esi
    382f:	5f                   	pop    %edi
    3830:	5d                   	pop    %ebp
    3831:	c3                   	ret    

00003832 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    3832:	f3 0f 1e fb          	endbr32 
    3836:	55                   	push   %ebp
    3837:	89 e5                	mov    %esp,%ebp
    3839:	53                   	push   %ebx
    383a:	8b 55 08             	mov    0x8(%ebp),%edx
    383d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    3840:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
    3843:	eb 09                	jmp    384e <strncmp+0x1c>
      n--, p++, q++;
    3845:	83 e8 01             	sub    $0x1,%eax
    3848:	83 c2 01             	add    $0x1,%edx
    384b:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
    384e:	85 c0                	test   %eax,%eax
    3850:	74 0b                	je     385d <strncmp+0x2b>
    3852:	0f b6 1a             	movzbl (%edx),%ebx
    3855:	84 db                	test   %bl,%bl
    3857:	74 04                	je     385d <strncmp+0x2b>
    3859:	3a 19                	cmp    (%ecx),%bl
    385b:	74 e8                	je     3845 <strncmp+0x13>
    if(n == 0)
    385d:	85 c0                	test   %eax,%eax
    385f:	74 0b                	je     386c <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
    3861:	0f b6 02             	movzbl (%edx),%eax
    3864:	0f b6 11             	movzbl (%ecx),%edx
    3867:	29 d0                	sub    %edx,%eax
}
    3869:	5b                   	pop    %ebx
    386a:	5d                   	pop    %ebp
    386b:	c3                   	ret    
      return 0;
    386c:	b8 00 00 00 00       	mov    $0x0,%eax
    3871:	eb f6                	jmp    3869 <strncmp+0x37>

00003873 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
    3873:	f3 0f 1e fb          	endbr32 
    3877:	55                   	push   %ebp
    3878:	89 e5                	mov    %esp,%ebp
    387a:	56                   	push   %esi
    387b:	53                   	push   %ebx
    387c:	8b 75 08             	mov    0x8(%ebp),%esi
    387f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    3882:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
    3885:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    3887:	8d 58 ff             	lea    -0x1(%eax),%ebx
    388a:	85 c0                	test   %eax,%eax
    388c:	7e 0f                	jle    389d <memmove+0x2a>
    *dst++ = *src++;
    388e:	0f b6 01             	movzbl (%ecx),%eax
    3891:	88 02                	mov    %al,(%edx)
    3893:	8d 49 01             	lea    0x1(%ecx),%ecx
    3896:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    3899:	89 d8                	mov    %ebx,%eax
    389b:	eb ea                	jmp    3887 <memmove+0x14>
  return vdst;
}
    389d:	89 f0                	mov    %esi,%eax
    389f:	5b                   	pop    %ebx
    38a0:	5e                   	pop    %esi
    38a1:	5d                   	pop    %ebp
    38a2:	c3                   	ret    

000038a3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    38a3:	b8 01 00 00 00       	mov    $0x1,%eax
    38a8:	cd 40                	int    $0x40
    38aa:	c3                   	ret    

000038ab <exit>:
SYSCALL(exit)
    38ab:	b8 02 00 00 00       	mov    $0x2,%eax
    38b0:	cd 40                	int    $0x40
    38b2:	c3                   	ret    

000038b3 <wait>:
SYSCALL(wait)
    38b3:	b8 03 00 00 00       	mov    $0x3,%eax
    38b8:	cd 40                	int    $0x40
    38ba:	c3                   	ret    

000038bb <pipe>:
SYSCALL(pipe)
    38bb:	b8 04 00 00 00       	mov    $0x4,%eax
    38c0:	cd 40                	int    $0x40
    38c2:	c3                   	ret    

000038c3 <read>:
SYSCALL(read)
    38c3:	b8 05 00 00 00       	mov    $0x5,%eax
    38c8:	cd 40                	int    $0x40
    38ca:	c3                   	ret    

000038cb <write>:
SYSCALL(write)
    38cb:	b8 10 00 00 00       	mov    $0x10,%eax
    38d0:	cd 40                	int    $0x40
    38d2:	c3                   	ret    

000038d3 <close>:
SYSCALL(close)
    38d3:	b8 15 00 00 00       	mov    $0x15,%eax
    38d8:	cd 40                	int    $0x40
    38da:	c3                   	ret    

000038db <kill>:
SYSCALL(kill)
    38db:	b8 06 00 00 00       	mov    $0x6,%eax
    38e0:	cd 40                	int    $0x40
    38e2:	c3                   	ret    

000038e3 <exec>:
SYSCALL(exec)
    38e3:	b8 07 00 00 00       	mov    $0x7,%eax
    38e8:	cd 40                	int    $0x40
    38ea:	c3                   	ret    

000038eb <open>:
SYSCALL(open)
    38eb:	b8 0f 00 00 00       	mov    $0xf,%eax
    38f0:	cd 40                	int    $0x40
    38f2:	c3                   	ret    

000038f3 <mknod>:
SYSCALL(mknod)
    38f3:	b8 11 00 00 00       	mov    $0x11,%eax
    38f8:	cd 40                	int    $0x40
    38fa:	c3                   	ret    

000038fb <unlink>:
SYSCALL(unlink)
    38fb:	b8 12 00 00 00       	mov    $0x12,%eax
    3900:	cd 40                	int    $0x40
    3902:	c3                   	ret    

00003903 <fstat>:
SYSCALL(fstat)
    3903:	b8 08 00 00 00       	mov    $0x8,%eax
    3908:	cd 40                	int    $0x40
    390a:	c3                   	ret    

0000390b <link>:
SYSCALL(link)
    390b:	b8 13 00 00 00       	mov    $0x13,%eax
    3910:	cd 40                	int    $0x40
    3912:	c3                   	ret    

00003913 <mkdir>:
SYSCALL(mkdir)
    3913:	b8 14 00 00 00       	mov    $0x14,%eax
    3918:	cd 40                	int    $0x40
    391a:	c3                   	ret    

0000391b <chdir>:
SYSCALL(chdir)
    391b:	b8 09 00 00 00       	mov    $0x9,%eax
    3920:	cd 40                	int    $0x40
    3922:	c3                   	ret    

00003923 <dup>:
SYSCALL(dup)
    3923:	b8 0a 00 00 00       	mov    $0xa,%eax
    3928:	cd 40                	int    $0x40
    392a:	c3                   	ret    

0000392b <getpid>:
SYSCALL(getpid)
    392b:	b8 0b 00 00 00       	mov    $0xb,%eax
    3930:	cd 40                	int    $0x40
    3932:	c3                   	ret    

00003933 <sbrk>:
SYSCALL(sbrk)
    3933:	b8 0c 00 00 00       	mov    $0xc,%eax
    3938:	cd 40                	int    $0x40
    393a:	c3                   	ret    

0000393b <sleep>:
SYSCALL(sleep)
    393b:	b8 0d 00 00 00       	mov    $0xd,%eax
    3940:	cd 40                	int    $0x40
    3942:	c3                   	ret    

00003943 <uptime>:
SYSCALL(uptime)
    3943:	b8 0e 00 00 00       	mov    $0xe,%eax
    3948:	cd 40                	int    $0x40
    394a:	c3                   	ret    

0000394b <halt>:
SYSCALL(halt)
    394b:	b8 16 00 00 00       	mov    $0x16,%eax
    3950:	cd 40                	int    $0x40
    3952:	c3                   	ret    

00003953 <date>:
SYSCALL(date)
    3953:	b8 17 00 00 00       	mov    $0x17,%eax
    3958:	cd 40                	int    $0x40
    395a:	c3                   	ret    

0000395b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    395b:	55                   	push   %ebp
    395c:	89 e5                	mov    %esp,%ebp
    395e:	83 ec 1c             	sub    $0x1c,%esp
    3961:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    3964:	6a 01                	push   $0x1
    3966:	8d 55 f4             	lea    -0xc(%ebp),%edx
    3969:	52                   	push   %edx
    396a:	50                   	push   %eax
    396b:	e8 5b ff ff ff       	call   38cb <write>
}
    3970:	83 c4 10             	add    $0x10,%esp
    3973:	c9                   	leave  
    3974:	c3                   	ret    

00003975 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3975:	55                   	push   %ebp
    3976:	89 e5                	mov    %esp,%ebp
    3978:	57                   	push   %edi
    3979:	56                   	push   %esi
    397a:	53                   	push   %ebx
    397b:	83 ec 2c             	sub    $0x2c,%esp
    397e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3981:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3983:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3987:	0f 95 c2             	setne  %dl
    398a:	89 f0                	mov    %esi,%eax
    398c:	c1 e8 1f             	shr    $0x1f,%eax
    398f:	84 c2                	test   %al,%dl
    3991:	74 42                	je     39d5 <printint+0x60>
    neg = 1;
    x = -xx;
    3993:	f7 de                	neg    %esi
    neg = 1;
    3995:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    399c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    39a1:	89 f0                	mov    %esi,%eax
    39a3:	ba 00 00 00 00       	mov    $0x0,%edx
    39a8:	f7 f1                	div    %ecx
    39aa:	89 df                	mov    %ebx,%edi
    39ac:	83 c3 01             	add    $0x1,%ebx
    39af:	0f b6 92 5c 54 00 00 	movzbl 0x545c(%edx),%edx
    39b6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    39ba:	89 f2                	mov    %esi,%edx
    39bc:	89 c6                	mov    %eax,%esi
    39be:	39 d1                	cmp    %edx,%ecx
    39c0:	76 df                	jbe    39a1 <printint+0x2c>
  if(neg)
    39c2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    39c6:	74 2f                	je     39f7 <printint+0x82>
    buf[i++] = '-';
    39c8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    39cd:	8d 5f 02             	lea    0x2(%edi),%ebx
    39d0:	8b 75 d0             	mov    -0x30(%ebp),%esi
    39d3:	eb 15                	jmp    39ea <printint+0x75>
  neg = 0;
    39d5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    39dc:	eb be                	jmp    399c <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
    39de:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    39e3:	89 f0                	mov    %esi,%eax
    39e5:	e8 71 ff ff ff       	call   395b <putc>
  while(--i >= 0)
    39ea:	83 eb 01             	sub    $0x1,%ebx
    39ed:	79 ef                	jns    39de <printint+0x69>
}
    39ef:	83 c4 2c             	add    $0x2c,%esp
    39f2:	5b                   	pop    %ebx
    39f3:	5e                   	pop    %esi
    39f4:	5f                   	pop    %edi
    39f5:	5d                   	pop    %ebp
    39f6:	c3                   	ret    
    39f7:	8b 75 d0             	mov    -0x30(%ebp),%esi
    39fa:	eb ee                	jmp    39ea <printint+0x75>

000039fc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    39fc:	f3 0f 1e fb          	endbr32 
    3a00:	55                   	push   %ebp
    3a01:	89 e5                	mov    %esp,%ebp
    3a03:	57                   	push   %edi
    3a04:	56                   	push   %esi
    3a05:	53                   	push   %ebx
    3a06:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    3a09:	8d 45 10             	lea    0x10(%ebp),%eax
    3a0c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    3a0f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    3a14:	bb 00 00 00 00       	mov    $0x0,%ebx
    3a19:	eb 14                	jmp    3a2f <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    3a1b:	89 fa                	mov    %edi,%edx
    3a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a20:	e8 36 ff ff ff       	call   395b <putc>
    3a25:	eb 05                	jmp    3a2c <printf+0x30>
      }
    } else if(state == '%'){
    3a27:	83 fe 25             	cmp    $0x25,%esi
    3a2a:	74 25                	je     3a51 <printf+0x55>
  for(i = 0; fmt[i]; i++){
    3a2c:	83 c3 01             	add    $0x1,%ebx
    3a2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a32:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    3a36:	84 c0                	test   %al,%al
    3a38:	0f 84 23 01 00 00    	je     3b61 <printf+0x165>
    c = fmt[i] & 0xff;
    3a3e:	0f be f8             	movsbl %al,%edi
    3a41:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    3a44:	85 f6                	test   %esi,%esi
    3a46:	75 df                	jne    3a27 <printf+0x2b>
      if(c == '%'){
    3a48:	83 f8 25             	cmp    $0x25,%eax
    3a4b:	75 ce                	jne    3a1b <printf+0x1f>
        state = '%';
    3a4d:	89 c6                	mov    %eax,%esi
    3a4f:	eb db                	jmp    3a2c <printf+0x30>
      if(c == 'd'){
    3a51:	83 f8 64             	cmp    $0x64,%eax
    3a54:	74 49                	je     3a9f <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3a56:	83 f8 78             	cmp    $0x78,%eax
    3a59:	0f 94 c1             	sete   %cl
    3a5c:	83 f8 70             	cmp    $0x70,%eax
    3a5f:	0f 94 c2             	sete   %dl
    3a62:	08 d1                	or     %dl,%cl
    3a64:	75 63                	jne    3ac9 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a66:	83 f8 73             	cmp    $0x73,%eax
    3a69:	0f 84 84 00 00 00    	je     3af3 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a6f:	83 f8 63             	cmp    $0x63,%eax
    3a72:	0f 84 b7 00 00 00    	je     3b2f <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3a78:	83 f8 25             	cmp    $0x25,%eax
    3a7b:	0f 84 cc 00 00 00    	je     3b4d <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3a81:	ba 25 00 00 00       	mov    $0x25,%edx
    3a86:	8b 45 08             	mov    0x8(%ebp),%eax
    3a89:	e8 cd fe ff ff       	call   395b <putc>
        putc(fd, c);
    3a8e:	89 fa                	mov    %edi,%edx
    3a90:	8b 45 08             	mov    0x8(%ebp),%eax
    3a93:	e8 c3 fe ff ff       	call   395b <putc>
      }
      state = 0;
    3a98:	be 00 00 00 00       	mov    $0x0,%esi
    3a9d:	eb 8d                	jmp    3a2c <printf+0x30>
        printint(fd, *ap, 10, 1);
    3a9f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3aa2:	8b 17                	mov    (%edi),%edx
    3aa4:	83 ec 0c             	sub    $0xc,%esp
    3aa7:	6a 01                	push   $0x1
    3aa9:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3aae:	8b 45 08             	mov    0x8(%ebp),%eax
    3ab1:	e8 bf fe ff ff       	call   3975 <printint>
        ap++;
    3ab6:	83 c7 04             	add    $0x4,%edi
    3ab9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    3abc:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3abf:	be 00 00 00 00       	mov    $0x0,%esi
    3ac4:	e9 63 ff ff ff       	jmp    3a2c <printf+0x30>
        printint(fd, *ap, 16, 0);
    3ac9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3acc:	8b 17                	mov    (%edi),%edx
    3ace:	83 ec 0c             	sub    $0xc,%esp
    3ad1:	6a 00                	push   $0x0
    3ad3:	b9 10 00 00 00       	mov    $0x10,%ecx
    3ad8:	8b 45 08             	mov    0x8(%ebp),%eax
    3adb:	e8 95 fe ff ff       	call   3975 <printint>
        ap++;
    3ae0:	83 c7 04             	add    $0x4,%edi
    3ae3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    3ae6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3ae9:	be 00 00 00 00       	mov    $0x0,%esi
    3aee:	e9 39 ff ff ff       	jmp    3a2c <printf+0x30>
        s = (char*)*ap;
    3af3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3af6:	8b 30                	mov    (%eax),%esi
        ap++;
    3af8:	83 c0 04             	add    $0x4,%eax
    3afb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    3afe:	85 f6                	test   %esi,%esi
    3b00:	75 28                	jne    3b2a <printf+0x12e>
          s = "(null)";
    3b02:	be 52 54 00 00       	mov    $0x5452,%esi
    3b07:	8b 7d 08             	mov    0x8(%ebp),%edi
    3b0a:	eb 0d                	jmp    3b19 <printf+0x11d>
          putc(fd, *s);
    3b0c:	0f be d2             	movsbl %dl,%edx
    3b0f:	89 f8                	mov    %edi,%eax
    3b11:	e8 45 fe ff ff       	call   395b <putc>
          s++;
    3b16:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    3b19:	0f b6 16             	movzbl (%esi),%edx
    3b1c:	84 d2                	test   %dl,%dl
    3b1e:	75 ec                	jne    3b0c <printf+0x110>
      state = 0;
    3b20:	be 00 00 00 00       	mov    $0x0,%esi
    3b25:	e9 02 ff ff ff       	jmp    3a2c <printf+0x30>
    3b2a:	8b 7d 08             	mov    0x8(%ebp),%edi
    3b2d:	eb ea                	jmp    3b19 <printf+0x11d>
        putc(fd, *ap);
    3b2f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3b32:	0f be 17             	movsbl (%edi),%edx
    3b35:	8b 45 08             	mov    0x8(%ebp),%eax
    3b38:	e8 1e fe ff ff       	call   395b <putc>
        ap++;
    3b3d:	83 c7 04             	add    $0x4,%edi
    3b40:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    3b43:	be 00 00 00 00       	mov    $0x0,%esi
    3b48:	e9 df fe ff ff       	jmp    3a2c <printf+0x30>
        putc(fd, c);
    3b4d:	89 fa                	mov    %edi,%edx
    3b4f:	8b 45 08             	mov    0x8(%ebp),%eax
    3b52:	e8 04 fe ff ff       	call   395b <putc>
      state = 0;
    3b57:	be 00 00 00 00       	mov    $0x0,%esi
    3b5c:	e9 cb fe ff ff       	jmp    3a2c <printf+0x30>
    }
  }
}
    3b61:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b64:	5b                   	pop    %ebx
    3b65:	5e                   	pop    %esi
    3b66:	5f                   	pop    %edi
    3b67:	5d                   	pop    %ebp
    3b68:	c3                   	ret    

00003b69 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b69:	f3 0f 1e fb          	endbr32 
    3b6d:	55                   	push   %ebp
    3b6e:	89 e5                	mov    %esp,%ebp
    3b70:	57                   	push   %edi
    3b71:	56                   	push   %esi
    3b72:	53                   	push   %ebx
    3b73:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3b76:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b79:	a1 e0 5d 00 00       	mov    0x5de0,%eax
    3b7e:	eb 02                	jmp    3b82 <free+0x19>
    3b80:	89 d0                	mov    %edx,%eax
    3b82:	39 c8                	cmp    %ecx,%eax
    3b84:	73 04                	jae    3b8a <free+0x21>
    3b86:	39 08                	cmp    %ecx,(%eax)
    3b88:	77 12                	ja     3b9c <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b8a:	8b 10                	mov    (%eax),%edx
    3b8c:	39 c2                	cmp    %eax,%edx
    3b8e:	77 f0                	ja     3b80 <free+0x17>
    3b90:	39 c8                	cmp    %ecx,%eax
    3b92:	72 08                	jb     3b9c <free+0x33>
    3b94:	39 ca                	cmp    %ecx,%edx
    3b96:	77 04                	ja     3b9c <free+0x33>
    3b98:	89 d0                	mov    %edx,%eax
    3b9a:	eb e6                	jmp    3b82 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3b9c:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3b9f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3ba2:	8b 10                	mov    (%eax),%edx
    3ba4:	39 d7                	cmp    %edx,%edi
    3ba6:	74 19                	je     3bc1 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3ba8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3bab:	8b 50 04             	mov    0x4(%eax),%edx
    3bae:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3bb1:	39 ce                	cmp    %ecx,%esi
    3bb3:	74 1b                	je     3bd0 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3bb5:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3bb7:	a3 e0 5d 00 00       	mov    %eax,0x5de0
}
    3bbc:	5b                   	pop    %ebx
    3bbd:	5e                   	pop    %esi
    3bbe:	5f                   	pop    %edi
    3bbf:	5d                   	pop    %ebp
    3bc0:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    3bc1:	03 72 04             	add    0x4(%edx),%esi
    3bc4:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3bc7:	8b 10                	mov    (%eax),%edx
    3bc9:	8b 12                	mov    (%edx),%edx
    3bcb:	89 53 f8             	mov    %edx,-0x8(%ebx)
    3bce:	eb db                	jmp    3bab <free+0x42>
    p->s.size += bp->s.size;
    3bd0:	03 53 fc             	add    -0x4(%ebx),%edx
    3bd3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3bd6:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3bd9:	89 10                	mov    %edx,(%eax)
    3bdb:	eb da                	jmp    3bb7 <free+0x4e>

00003bdd <morecore>:

static Header*
morecore(uint nu)
{
    3bdd:	55                   	push   %ebp
    3bde:	89 e5                	mov    %esp,%ebp
    3be0:	53                   	push   %ebx
    3be1:	83 ec 04             	sub    $0x4,%esp
    3be4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    3be6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    3beb:	77 05                	ja     3bf2 <morecore+0x15>
    nu = 4096;
    3bed:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    3bf2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    3bf9:	83 ec 0c             	sub    $0xc,%esp
    3bfc:	50                   	push   %eax
    3bfd:	e8 31 fd ff ff       	call   3933 <sbrk>
  if(p == (char*)-1)
    3c02:	83 c4 10             	add    $0x10,%esp
    3c05:	83 f8 ff             	cmp    $0xffffffff,%eax
    3c08:	74 1c                	je     3c26 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3c0a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3c0d:	83 c0 08             	add    $0x8,%eax
    3c10:	83 ec 0c             	sub    $0xc,%esp
    3c13:	50                   	push   %eax
    3c14:	e8 50 ff ff ff       	call   3b69 <free>
  return freep;
    3c19:	a1 e0 5d 00 00       	mov    0x5de0,%eax
    3c1e:	83 c4 10             	add    $0x10,%esp
}
    3c21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3c24:	c9                   	leave  
    3c25:	c3                   	ret    
    return 0;
    3c26:	b8 00 00 00 00       	mov    $0x0,%eax
    3c2b:	eb f4                	jmp    3c21 <morecore+0x44>

00003c2d <malloc>:

void*
malloc(uint nbytes)
{
    3c2d:	f3 0f 1e fb          	endbr32 
    3c31:	55                   	push   %ebp
    3c32:	89 e5                	mov    %esp,%ebp
    3c34:	53                   	push   %ebx
    3c35:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c38:	8b 45 08             	mov    0x8(%ebp),%eax
    3c3b:	8d 58 07             	lea    0x7(%eax),%ebx
    3c3e:	c1 eb 03             	shr    $0x3,%ebx
    3c41:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    3c44:	8b 0d e0 5d 00 00    	mov    0x5de0,%ecx
    3c4a:	85 c9                	test   %ecx,%ecx
    3c4c:	74 04                	je     3c52 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c4e:	8b 01                	mov    (%ecx),%eax
    3c50:	eb 4b                	jmp    3c9d <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
    3c52:	c7 05 e0 5d 00 00 e4 	movl   $0x5de4,0x5de0
    3c59:	5d 00 00 
    3c5c:	c7 05 e4 5d 00 00 e4 	movl   $0x5de4,0x5de4
    3c63:	5d 00 00 
    base.s.size = 0;
    3c66:	c7 05 e8 5d 00 00 00 	movl   $0x0,0x5de8
    3c6d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    3c70:	b9 e4 5d 00 00       	mov    $0x5de4,%ecx
    3c75:	eb d7                	jmp    3c4e <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3c77:	74 1a                	je     3c93 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3c79:	29 da                	sub    %ebx,%edx
    3c7b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    3c7e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    3c81:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    3c84:	89 0d e0 5d 00 00    	mov    %ecx,0x5de0
      return (void*)(p + 1);
    3c8a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3c8d:	83 c4 04             	add    $0x4,%esp
    3c90:	5b                   	pop    %ebx
    3c91:	5d                   	pop    %ebp
    3c92:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    3c93:	8b 10                	mov    (%eax),%edx
    3c95:	89 11                	mov    %edx,(%ecx)
    3c97:	eb eb                	jmp    3c84 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c99:	89 c1                	mov    %eax,%ecx
    3c9b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    3c9d:	8b 50 04             	mov    0x4(%eax),%edx
    3ca0:	39 da                	cmp    %ebx,%edx
    3ca2:	73 d3                	jae    3c77 <malloc+0x4a>
    if(p == freep)
    3ca4:	39 05 e0 5d 00 00    	cmp    %eax,0x5de0
    3caa:	75 ed                	jne    3c99 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
    3cac:	89 d8                	mov    %ebx,%eax
    3cae:	e8 2a ff ff ff       	call   3bdd <morecore>
    3cb3:	85 c0                	test   %eax,%eax
    3cb5:	75 e2                	jne    3c99 <malloc+0x6c>
    3cb7:	eb d4                	jmp    3c8d <malloc+0x60>
