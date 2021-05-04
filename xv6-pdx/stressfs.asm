
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  1a:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  21:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  28:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2e:	68 c4 07 00 00       	push   $0x7c4
  33:	6a 01                	push   $0x1
  35:	e8 cd 04 00 00       	call   507 <printf>
  memset(data, 'a', sizeof(data));
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 40 01 00 00       	call   190 <memset>

  for(i = 0; i < 4; i++)
  50:	83 c4 10             	add    $0x10,%esp
  53:	bb 00 00 00 00       	mov    $0x0,%ebx
  58:	83 fb 03             	cmp    $0x3,%ebx
  5b:	7f 0e                	jg     6b <main+0x6b>
    if(fork() > 0)
  5d:	e8 4c 03 00 00       	call   3ae <fork>
  62:	85 c0                	test   %eax,%eax
  64:	7f 05                	jg     6b <main+0x6b>
  for(i = 0; i < 4; i++)
  66:	83 c3 01             	add    $0x1,%ebx
  69:	eb ed                	jmp    58 <main+0x58>
      break;

  printf(1, "write %d\n", i);
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	53                   	push   %ebx
  6f:	68 d7 07 00 00       	push   $0x7d7
  74:	6a 01                	push   $0x1
  76:	e8 8c 04 00 00       	call   507 <printf>

  path[8] += i;
  7b:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7e:	83 c4 08             	add    $0x8,%esp
  81:	68 02 02 00 00       	push   $0x202
  86:	8d 45 de             	lea    -0x22(%ebp),%eax
  89:	50                   	push   %eax
  8a:	e8 67 03 00 00       	call   3f6 <open>
  8f:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  91:	83 c4 10             	add    $0x10,%esp
  94:	bb 00 00 00 00       	mov    $0x0,%ebx
  99:	eb 1b                	jmp    b6 <main+0xb6>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  9b:	83 ec 04             	sub    $0x4,%esp
  9e:	68 00 02 00 00       	push   $0x200
  a3:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a9:	50                   	push   %eax
  aa:	56                   	push   %esi
  ab:	e8 26 03 00 00       	call   3d6 <write>
  for(i = 0; i < 20; i++)
  b0:	83 c3 01             	add    $0x1,%ebx
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	83 fb 13             	cmp    $0x13,%ebx
  b9:	7e e0                	jle    9b <main+0x9b>
  close(fd);
  bb:	83 ec 0c             	sub    $0xc,%esp
  be:	56                   	push   %esi
  bf:	e8 1a 03 00 00       	call   3de <close>

  printf(1, "read\n");
  c4:	83 c4 08             	add    $0x8,%esp
  c7:	68 e1 07 00 00       	push   $0x7e1
  cc:	6a 01                	push   $0x1
  ce:	e8 34 04 00 00       	call   507 <printf>

  fd = open(path, O_RDONLY);
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	6a 00                	push   $0x0
  d8:	8d 45 de             	lea    -0x22(%ebp),%eax
  db:	50                   	push   %eax
  dc:	e8 15 03 00 00       	call   3f6 <open>
  e1:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  e3:	83 c4 10             	add    $0x10,%esp
  e6:	bb 00 00 00 00       	mov    $0x0,%ebx
  eb:	eb 1b                	jmp    108 <main+0x108>
    read(fd, data, sizeof(data));
  ed:	83 ec 04             	sub    $0x4,%esp
  f0:	68 00 02 00 00       	push   $0x200
  f5:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  fb:	50                   	push   %eax
  fc:	56                   	push   %esi
  fd:	e8 cc 02 00 00       	call   3ce <read>
  for (i = 0; i < 20; i++)
 102:	83 c3 01             	add    $0x1,%ebx
 105:	83 c4 10             	add    $0x10,%esp
 108:	83 fb 13             	cmp    $0x13,%ebx
 10b:	7e e0                	jle    ed <main+0xed>
  close(fd);
 10d:	83 ec 0c             	sub    $0xc,%esp
 110:	56                   	push   %esi
 111:	e8 c8 02 00 00       	call   3de <close>

  wait();
 116:	e8 a3 02 00 00       	call   3be <wait>

  exit();
 11b:	e8 96 02 00 00       	call   3b6 <exit>

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	56                   	push   %esi
 128:	53                   	push   %ebx
 129:	8b 75 08             	mov    0x8(%ebp),%esi
 12c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12f:	89 f0                	mov    %esi,%eax
 131:	89 d1                	mov    %edx,%ecx
 133:	83 c2 01             	add    $0x1,%edx
 136:	89 c3                	mov    %eax,%ebx
 138:	83 c0 01             	add    $0x1,%eax
 13b:	0f b6 09             	movzbl (%ecx),%ecx
 13e:	88 0b                	mov    %cl,(%ebx)
 140:	84 c9                	test   %cl,%cl
 142:	75 ed                	jne    131 <strcpy+0x11>
    ;
  return os;
}
 144:	89 f0                	mov    %esi,%eax
 146:	5b                   	pop    %ebx
 147:	5e                   	pop    %esi
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    

0000014a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14a:	f3 0f 1e fb          	endbr32 
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
 151:	8b 4d 08             	mov    0x8(%ebp),%ecx
 154:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 157:	0f b6 01             	movzbl (%ecx),%eax
 15a:	84 c0                	test   %al,%al
 15c:	74 0c                	je     16a <strcmp+0x20>
 15e:	3a 02                	cmp    (%edx),%al
 160:	75 08                	jne    16a <strcmp+0x20>
    p++, q++;
 162:	83 c1 01             	add    $0x1,%ecx
 165:	83 c2 01             	add    $0x1,%edx
 168:	eb ed                	jmp    157 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 16a:	0f b6 c0             	movzbl %al,%eax
 16d:	0f b6 12             	movzbl (%edx),%edx
 170:	29 d0                	sub    %edx,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    

00000174 <strlen>:

uint
strlen(char *s)
{
 174:	f3 0f 1e fb          	endbr32 
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
 183:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 187:	74 05                	je     18e <strlen+0x1a>
 189:	83 c0 01             	add    $0x1,%eax
 18c:	eb f5                	jmp    183 <strlen+0xf>
    ;
  return n;
}
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 19b:	89 d7                	mov    %edx,%edi
 19d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a3:	fc                   	cld    
 1a4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a6:	89 d0                	mov    %edx,%eax
 1a8:	5f                   	pop    %edi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    

000001ab <strchr>:

char*
strchr(const char *s, char c)
{
 1ab:	f3 0f 1e fb          	endbr32 
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 1b5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1b9:	0f b6 10             	movzbl (%eax),%edx
 1bc:	84 d2                	test   %dl,%dl
 1be:	74 09                	je     1c9 <strchr+0x1e>
    if(*s == c)
 1c0:	38 ca                	cmp    %cl,%dl
 1c2:	74 0a                	je     1ce <strchr+0x23>
  for(; *s; s++)
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	eb f0                	jmp    1b9 <strchr+0xe>
      return (char*)s;
  return 0;
 1c9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	56                   	push   %esi
 1d9:	53                   	push   %ebx
 1da:	83 ec 1c             	sub    $0x1c,%esp
 1dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1e5:	89 de                	mov    %ebx,%esi
 1e7:	83 c3 01             	add    $0x1,%ebx
 1ea:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ed:	7d 2e                	jge    21d <gets+0x4d>
    cc = read(0, &c, 1);
 1ef:	83 ec 04             	sub    $0x4,%esp
 1f2:	6a 01                	push   $0x1
 1f4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1f7:	50                   	push   %eax
 1f8:	6a 00                	push   $0x0
 1fa:	e8 cf 01 00 00       	call   3ce <read>
    if(cc < 1)
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	85 c0                	test   %eax,%eax
 204:	7e 17                	jle    21d <gets+0x4d>
      break;
    buf[i++] = c;
 206:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 20a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 20d:	3c 0a                	cmp    $0xa,%al
 20f:	0f 94 c2             	sete   %dl
 212:	3c 0d                	cmp    $0xd,%al
 214:	0f 94 c0             	sete   %al
 217:	08 c2                	or     %al,%dl
 219:	74 ca                	je     1e5 <gets+0x15>
    buf[i++] = c;
 21b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 21d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 221:	89 f8                	mov    %edi,%eax
 223:	8d 65 f4             	lea    -0xc(%ebp),%esp
 226:	5b                   	pop    %ebx
 227:	5e                   	pop    %esi
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    

0000022b <stat>:

int
stat(char *n, struct stat *st)
{
 22b:	f3 0f 1e fb          	endbr32 
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	56                   	push   %esi
 233:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 234:	83 ec 08             	sub    $0x8,%esp
 237:	6a 00                	push   $0x0
 239:	ff 75 08             	pushl  0x8(%ebp)
 23c:	e8 b5 01 00 00       	call   3f6 <open>
  if(fd < 0)
 241:	83 c4 10             	add    $0x10,%esp
 244:	85 c0                	test   %eax,%eax
 246:	78 24                	js     26c <stat+0x41>
 248:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24a:	83 ec 08             	sub    $0x8,%esp
 24d:	ff 75 0c             	pushl  0xc(%ebp)
 250:	50                   	push   %eax
 251:	e8 b8 01 00 00       	call   40e <fstat>
 256:	89 c6                	mov    %eax,%esi
  close(fd);
 258:	89 1c 24             	mov    %ebx,(%esp)
 25b:	e8 7e 01 00 00       	call   3de <close>
  return r;
 260:	83 c4 10             	add    $0x10,%esp
}
 263:	89 f0                	mov    %esi,%eax
 265:	8d 65 f8             	lea    -0x8(%ebp),%esp
 268:	5b                   	pop    %ebx
 269:	5e                   	pop    %esi
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
    return -1;
 26c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 271:	eb f0                	jmp    263 <stat+0x38>

00000273 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 273:	f3 0f 1e fb          	endbr32 
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	57                   	push   %edi
 27b:	56                   	push   %esi
 27c:	53                   	push   %ebx
 27d:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 280:	0f b6 02             	movzbl (%edx),%eax
 283:	3c 20                	cmp    $0x20,%al
 285:	75 05                	jne    28c <atoi+0x19>
 287:	83 c2 01             	add    $0x1,%edx
 28a:	eb f4                	jmp    280 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 28c:	3c 2d                	cmp    $0x2d,%al
 28e:	74 1d                	je     2ad <atoi+0x3a>
 290:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 295:	3c 2b                	cmp    $0x2b,%al
 297:	0f 94 c1             	sete   %cl
 29a:	3c 2d                	cmp    $0x2d,%al
 29c:	0f 94 c0             	sete   %al
 29f:	08 c1                	or     %al,%cl
 2a1:	74 03                	je     2a6 <atoi+0x33>
    s++;
 2a3:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 2a6:	b8 00 00 00 00       	mov    $0x0,%eax
 2ab:	eb 17                	jmp    2c4 <atoi+0x51>
 2ad:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 2b2:	eb e1                	jmp    295 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 2b4:	8d 34 80             	lea    (%eax,%eax,4),%esi
 2b7:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 2ba:	83 c2 01             	add    $0x1,%edx
 2bd:	0f be c9             	movsbl %cl,%ecx
 2c0:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 2c4:	0f b6 0a             	movzbl (%edx),%ecx
 2c7:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 2ca:	80 fb 09             	cmp    $0x9,%bl
 2cd:	76 e5                	jbe    2b4 <atoi+0x41>
  return sign*n;
 2cf:	0f af c7             	imul   %edi,%eax
}
 2d2:	5b                   	pop    %ebx
 2d3:	5e                   	pop    %esi
 2d4:	5f                   	pop    %edi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    

000002d7 <atoo>:

int
atoo(const char *s)
{
 2d7:	f3 0f 1e fb          	endbr32 
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	57                   	push   %edi
 2df:	56                   	push   %esi
 2e0:	53                   	push   %ebx
 2e1:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 2e4:	0f b6 0a             	movzbl (%edx),%ecx
 2e7:	80 f9 20             	cmp    $0x20,%cl
 2ea:	75 05                	jne    2f1 <atoo+0x1a>
 2ec:	83 c2 01             	add    $0x1,%edx
 2ef:	eb f3                	jmp    2e4 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 2f1:	80 f9 2d             	cmp    $0x2d,%cl
 2f4:	74 23                	je     319 <atoo+0x42>
 2f6:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 2fb:	80 f9 2b             	cmp    $0x2b,%cl
 2fe:	0f 94 c0             	sete   %al
 301:	89 c6                	mov    %eax,%esi
 303:	80 f9 2d             	cmp    $0x2d,%cl
 306:	0f 94 c0             	sete   %al
 309:	89 f3                	mov    %esi,%ebx
 30b:	08 c3                	or     %al,%bl
 30d:	74 03                	je     312 <atoo+0x3b>
    s++;
 30f:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 312:	b8 00 00 00 00       	mov    $0x0,%eax
 317:	eb 11                	jmp    32a <atoo+0x53>
 319:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 31e:	eb db                	jmp    2fb <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	0f be c9             	movsbl %cl,%ecx
 326:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 32a:	0f b6 0a             	movzbl (%edx),%ecx
 32d:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 330:	80 fb 07             	cmp    $0x7,%bl
 333:	76 eb                	jbe    320 <atoo+0x49>
  return sign*n;
 335:	0f af c7             	imul   %edi,%eax
}
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    

0000033d <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 33d:	f3 0f 1e fb          	endbr32 
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	53                   	push   %ebx
 345:	8b 55 08             	mov    0x8(%ebp),%edx
 348:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 34b:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 34e:	eb 09                	jmp    359 <strncmp+0x1c>
      n--, p++, q++;
 350:	83 e8 01             	sub    $0x1,%eax
 353:	83 c2 01             	add    $0x1,%edx
 356:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 359:	85 c0                	test   %eax,%eax
 35b:	74 0b                	je     368 <strncmp+0x2b>
 35d:	0f b6 1a             	movzbl (%edx),%ebx
 360:	84 db                	test   %bl,%bl
 362:	74 04                	je     368 <strncmp+0x2b>
 364:	3a 19                	cmp    (%ecx),%bl
 366:	74 e8                	je     350 <strncmp+0x13>
    if(n == 0)
 368:	85 c0                	test   %eax,%eax
 36a:	74 0b                	je     377 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 36c:	0f b6 02             	movzbl (%edx),%eax
 36f:	0f b6 11             	movzbl (%ecx),%edx
 372:	29 d0                	sub    %edx,%eax
}
 374:	5b                   	pop    %ebx
 375:	5d                   	pop    %ebp
 376:	c3                   	ret    
      return 0;
 377:	b8 00 00 00 00       	mov    $0x0,%eax
 37c:	eb f6                	jmp    374 <strncmp+0x37>

0000037e <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 37e:	f3 0f 1e fb          	endbr32 
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	56                   	push   %esi
 386:	53                   	push   %ebx
 387:	8b 75 08             	mov    0x8(%ebp),%esi
 38a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 38d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 390:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 392:	8d 58 ff             	lea    -0x1(%eax),%ebx
 395:	85 c0                	test   %eax,%eax
 397:	7e 0f                	jle    3a8 <memmove+0x2a>
    *dst++ = *src++;
 399:	0f b6 01             	movzbl (%ecx),%eax
 39c:	88 02                	mov    %al,(%edx)
 39e:	8d 49 01             	lea    0x1(%ecx),%ecx
 3a1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3a4:	89 d8                	mov    %ebx,%eax
 3a6:	eb ea                	jmp    392 <memmove+0x14>
  return vdst;
}
 3a8:	89 f0                	mov    %esi,%eax
 3aa:	5b                   	pop    %ebx
 3ab:	5e                   	pop    %esi
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ae:	b8 01 00 00 00       	mov    $0x1,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <exit>:
SYSCALL(exit)
 3b6:	b8 02 00 00 00       	mov    $0x2,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <wait>:
SYSCALL(wait)
 3be:	b8 03 00 00 00       	mov    $0x3,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <pipe>:
SYSCALL(pipe)
 3c6:	b8 04 00 00 00       	mov    $0x4,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <read>:
SYSCALL(read)
 3ce:	b8 05 00 00 00       	mov    $0x5,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <write>:
SYSCALL(write)
 3d6:	b8 10 00 00 00       	mov    $0x10,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <close>:
SYSCALL(close)
 3de:	b8 15 00 00 00       	mov    $0x15,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <kill>:
SYSCALL(kill)
 3e6:	b8 06 00 00 00       	mov    $0x6,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <exec>:
SYSCALL(exec)
 3ee:	b8 07 00 00 00       	mov    $0x7,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <open>:
SYSCALL(open)
 3f6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <mknod>:
SYSCALL(mknod)
 3fe:	b8 11 00 00 00       	mov    $0x11,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <unlink>:
SYSCALL(unlink)
 406:	b8 12 00 00 00       	mov    $0x12,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <fstat>:
SYSCALL(fstat)
 40e:	b8 08 00 00 00       	mov    $0x8,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <link>:
SYSCALL(link)
 416:	b8 13 00 00 00       	mov    $0x13,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <mkdir>:
SYSCALL(mkdir)
 41e:	b8 14 00 00 00       	mov    $0x14,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <chdir>:
SYSCALL(chdir)
 426:	b8 09 00 00 00       	mov    $0x9,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <dup>:
SYSCALL(dup)
 42e:	b8 0a 00 00 00       	mov    $0xa,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <getpid>:
SYSCALL(getpid)
 436:	b8 0b 00 00 00       	mov    $0xb,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <sbrk>:
SYSCALL(sbrk)
 43e:	b8 0c 00 00 00       	mov    $0xc,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <sleep>:
SYSCALL(sleep)
 446:	b8 0d 00 00 00       	mov    $0xd,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <uptime>:
SYSCALL(uptime)
 44e:	b8 0e 00 00 00       	mov    $0xe,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <halt>:
SYSCALL(halt)
 456:	b8 16 00 00 00       	mov    $0x16,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <date>:
SYSCALL(date)
 45e:	b8 17 00 00 00       	mov    $0x17,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	83 ec 1c             	sub    $0x1c,%esp
 46c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 46f:	6a 01                	push   $0x1
 471:	8d 55 f4             	lea    -0xc(%ebp),%edx
 474:	52                   	push   %edx
 475:	50                   	push   %eax
 476:	e8 5b ff ff ff       	call   3d6 <write>
}
 47b:	83 c4 10             	add    $0x10,%esp
 47e:	c9                   	leave  
 47f:	c3                   	ret    

00000480 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 2c             	sub    $0x2c,%esp
 489:	89 45 d0             	mov    %eax,-0x30(%ebp)
 48c:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 48e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 492:	0f 95 c2             	setne  %dl
 495:	89 f0                	mov    %esi,%eax
 497:	c1 e8 1f             	shr    $0x1f,%eax
 49a:	84 c2                	test   %al,%dl
 49c:	74 42                	je     4e0 <printint+0x60>
    neg = 1;
    x = -xx;
 49e:	f7 de                	neg    %esi
    neg = 1;
 4a0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4a7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4ac:	89 f0                	mov    %esi,%eax
 4ae:	ba 00 00 00 00       	mov    $0x0,%edx
 4b3:	f7 f1                	div    %ecx
 4b5:	89 df                	mov    %ebx,%edi
 4b7:	83 c3 01             	add    $0x1,%ebx
 4ba:	0f b6 92 f0 07 00 00 	movzbl 0x7f0(%edx),%edx
 4c1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4c5:	89 f2                	mov    %esi,%edx
 4c7:	89 c6                	mov    %eax,%esi
 4c9:	39 d1                	cmp    %edx,%ecx
 4cb:	76 df                	jbe    4ac <printint+0x2c>
  if(neg)
 4cd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4d1:	74 2f                	je     502 <printint+0x82>
    buf[i++] = '-';
 4d3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4d8:	8d 5f 02             	lea    0x2(%edi),%ebx
 4db:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4de:	eb 15                	jmp    4f5 <printint+0x75>
  neg = 0;
 4e0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4e7:	eb be                	jmp    4a7 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 4e9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4ee:	89 f0                	mov    %esi,%eax
 4f0:	e8 71 ff ff ff       	call   466 <putc>
  while(--i >= 0)
 4f5:	83 eb 01             	sub    $0x1,%ebx
 4f8:	79 ef                	jns    4e9 <printint+0x69>
}
 4fa:	83 c4 2c             	add    $0x2c,%esp
 4fd:	5b                   	pop    %ebx
 4fe:	5e                   	pop    %esi
 4ff:	5f                   	pop    %edi
 500:	5d                   	pop    %ebp
 501:	c3                   	ret    
 502:	8b 75 d0             	mov    -0x30(%ebp),%esi
 505:	eb ee                	jmp    4f5 <printint+0x75>

00000507 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 507:	f3 0f 1e fb          	endbr32 
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	57                   	push   %edi
 50f:	56                   	push   %esi
 510:	53                   	push   %ebx
 511:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 514:	8d 45 10             	lea    0x10(%ebp),%eax
 517:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 51a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 51f:	bb 00 00 00 00       	mov    $0x0,%ebx
 524:	eb 14                	jmp    53a <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 526:	89 fa                	mov    %edi,%edx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	e8 36 ff ff ff       	call   466 <putc>
 530:	eb 05                	jmp    537 <printf+0x30>
      }
    } else if(state == '%'){
 532:	83 fe 25             	cmp    $0x25,%esi
 535:	74 25                	je     55c <printf+0x55>
  for(i = 0; fmt[i]; i++){
 537:	83 c3 01             	add    $0x1,%ebx
 53a:	8b 45 0c             	mov    0xc(%ebp),%eax
 53d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 541:	84 c0                	test   %al,%al
 543:	0f 84 23 01 00 00    	je     66c <printf+0x165>
    c = fmt[i] & 0xff;
 549:	0f be f8             	movsbl %al,%edi
 54c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 54f:	85 f6                	test   %esi,%esi
 551:	75 df                	jne    532 <printf+0x2b>
      if(c == '%'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	75 ce                	jne    526 <printf+0x1f>
        state = '%';
 558:	89 c6                	mov    %eax,%esi
 55a:	eb db                	jmp    537 <printf+0x30>
      if(c == 'd'){
 55c:	83 f8 64             	cmp    $0x64,%eax
 55f:	74 49                	je     5aa <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 561:	83 f8 78             	cmp    $0x78,%eax
 564:	0f 94 c1             	sete   %cl
 567:	83 f8 70             	cmp    $0x70,%eax
 56a:	0f 94 c2             	sete   %dl
 56d:	08 d1                	or     %dl,%cl
 56f:	75 63                	jne    5d4 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 571:	83 f8 73             	cmp    $0x73,%eax
 574:	0f 84 84 00 00 00    	je     5fe <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57a:	83 f8 63             	cmp    $0x63,%eax
 57d:	0f 84 b7 00 00 00    	je     63a <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 583:	83 f8 25             	cmp    $0x25,%eax
 586:	0f 84 cc 00 00 00    	je     658 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58c:	ba 25 00 00 00       	mov    $0x25,%edx
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	e8 cd fe ff ff       	call   466 <putc>
        putc(fd, c);
 599:	89 fa                	mov    %edi,%edx
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	e8 c3 fe ff ff       	call   466 <putc>
      }
      state = 0;
 5a3:	be 00 00 00 00       	mov    $0x0,%esi
 5a8:	eb 8d                	jmp    537 <printf+0x30>
        printint(fd, *ap, 10, 1);
 5aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ad:	8b 17                	mov    (%edi),%edx
 5af:	83 ec 0c             	sub    $0xc,%esp
 5b2:	6a 01                	push   $0x1
 5b4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	e8 bf fe ff ff       	call   480 <printint>
        ap++;
 5c1:	83 c7 04             	add    $0x4,%edi
 5c4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5c7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ca:	be 00 00 00 00       	mov    $0x0,%esi
 5cf:	e9 63 ff ff ff       	jmp    537 <printf+0x30>
        printint(fd, *ap, 16, 0);
 5d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5d7:	8b 17                	mov    (%edi),%edx
 5d9:	83 ec 0c             	sub    $0xc,%esp
 5dc:	6a 00                	push   $0x0
 5de:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	e8 95 fe ff ff       	call   480 <printint>
        ap++;
 5eb:	83 c7 04             	add    $0x4,%edi
 5ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5f4:	be 00 00 00 00       	mov    $0x0,%esi
 5f9:	e9 39 ff ff ff       	jmp    537 <printf+0x30>
        s = (char*)*ap;
 5fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 601:	8b 30                	mov    (%eax),%esi
        ap++;
 603:	83 c0 04             	add    $0x4,%eax
 606:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 609:	85 f6                	test   %esi,%esi
 60b:	75 28                	jne    635 <printf+0x12e>
          s = "(null)";
 60d:	be e7 07 00 00       	mov    $0x7e7,%esi
 612:	8b 7d 08             	mov    0x8(%ebp),%edi
 615:	eb 0d                	jmp    624 <printf+0x11d>
          putc(fd, *s);
 617:	0f be d2             	movsbl %dl,%edx
 61a:	89 f8                	mov    %edi,%eax
 61c:	e8 45 fe ff ff       	call   466 <putc>
          s++;
 621:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 624:	0f b6 16             	movzbl (%esi),%edx
 627:	84 d2                	test   %dl,%dl
 629:	75 ec                	jne    617 <printf+0x110>
      state = 0;
 62b:	be 00 00 00 00       	mov    $0x0,%esi
 630:	e9 02 ff ff ff       	jmp    537 <printf+0x30>
 635:	8b 7d 08             	mov    0x8(%ebp),%edi
 638:	eb ea                	jmp    624 <printf+0x11d>
        putc(fd, *ap);
 63a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 63d:	0f be 17             	movsbl (%edi),%edx
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	e8 1e fe ff ff       	call   466 <putc>
        ap++;
 648:	83 c7 04             	add    $0x4,%edi
 64b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 64e:	be 00 00 00 00       	mov    $0x0,%esi
 653:	e9 df fe ff ff       	jmp    537 <printf+0x30>
        putc(fd, c);
 658:	89 fa                	mov    %edi,%edx
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	e8 04 fe ff ff       	call   466 <putc>
      state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
 667:	e9 cb fe ff ff       	jmp    537 <printf+0x30>
    }
  }
}
 66c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    

00000674 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 674:	f3 0f 1e fb          	endbr32 
 678:	55                   	push   %ebp
 679:	89 e5                	mov    %esp,%ebp
 67b:	57                   	push   %edi
 67c:	56                   	push   %esi
 67d:	53                   	push   %ebx
 67e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 681:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 684:	a1 f4 0a 00 00       	mov    0xaf4,%eax
 689:	eb 02                	jmp    68d <free+0x19>
 68b:	89 d0                	mov    %edx,%eax
 68d:	39 c8                	cmp    %ecx,%eax
 68f:	73 04                	jae    695 <free+0x21>
 691:	39 08                	cmp    %ecx,(%eax)
 693:	77 12                	ja     6a7 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 695:	8b 10                	mov    (%eax),%edx
 697:	39 c2                	cmp    %eax,%edx
 699:	77 f0                	ja     68b <free+0x17>
 69b:	39 c8                	cmp    %ecx,%eax
 69d:	72 08                	jb     6a7 <free+0x33>
 69f:	39 ca                	cmp    %ecx,%edx
 6a1:	77 04                	ja     6a7 <free+0x33>
 6a3:	89 d0                	mov    %edx,%eax
 6a5:	eb e6                	jmp    68d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6aa:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ad:	8b 10                	mov    (%eax),%edx
 6af:	39 d7                	cmp    %edx,%edi
 6b1:	74 19                	je     6cc <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b6:	8b 50 04             	mov    0x4(%eax),%edx
 6b9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6bc:	39 ce                	cmp    %ecx,%esi
 6be:	74 1b                	je     6db <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6c0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c2:	a3 f4 0a 00 00       	mov    %eax,0xaf4
}
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6cc:	03 72 04             	add    0x4(%edx),%esi
 6cf:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	8b 12                	mov    (%edx),%edx
 6d6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6d9:	eb db                	jmp    6b6 <free+0x42>
    p->s.size += bp->s.size;
 6db:	03 53 fc             	add    -0x4(%ebx),%edx
 6de:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e4:	89 10                	mov    %edx,(%eax)
 6e6:	eb da                	jmp    6c2 <free+0x4e>

000006e8 <morecore>:

static Header*
morecore(uint nu)
{
 6e8:	55                   	push   %ebp
 6e9:	89 e5                	mov    %esp,%ebp
 6eb:	53                   	push   %ebx
 6ec:	83 ec 04             	sub    $0x4,%esp
 6ef:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6f1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6f6:	77 05                	ja     6fd <morecore+0x15>
    nu = 4096;
 6f8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6fd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 704:	83 ec 0c             	sub    $0xc,%esp
 707:	50                   	push   %eax
 708:	e8 31 fd ff ff       	call   43e <sbrk>
  if(p == (char*)-1)
 70d:	83 c4 10             	add    $0x10,%esp
 710:	83 f8 ff             	cmp    $0xffffffff,%eax
 713:	74 1c                	je     731 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 715:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 718:	83 c0 08             	add    $0x8,%eax
 71b:	83 ec 0c             	sub    $0xc,%esp
 71e:	50                   	push   %eax
 71f:	e8 50 ff ff ff       	call   674 <free>
  return freep;
 724:	a1 f4 0a 00 00       	mov    0xaf4,%eax
 729:	83 c4 10             	add    $0x10,%esp
}
 72c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 72f:	c9                   	leave  
 730:	c3                   	ret    
    return 0;
 731:	b8 00 00 00 00       	mov    $0x0,%eax
 736:	eb f4                	jmp    72c <morecore+0x44>

00000738 <malloc>:

void*
malloc(uint nbytes)
{
 738:	f3 0f 1e fb          	endbr32 
 73c:	55                   	push   %ebp
 73d:	89 e5                	mov    %esp,%ebp
 73f:	53                   	push   %ebx
 740:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	8d 58 07             	lea    0x7(%eax),%ebx
 749:	c1 eb 03             	shr    $0x3,%ebx
 74c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 74f:	8b 0d f4 0a 00 00    	mov    0xaf4,%ecx
 755:	85 c9                	test   %ecx,%ecx
 757:	74 04                	je     75d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 759:	8b 01                	mov    (%ecx),%eax
 75b:	eb 4b                	jmp    7a8 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 75d:	c7 05 f4 0a 00 00 f8 	movl   $0xaf8,0xaf4
 764:	0a 00 00 
 767:	c7 05 f8 0a 00 00 f8 	movl   $0xaf8,0xaf8
 76e:	0a 00 00 
    base.s.size = 0;
 771:	c7 05 fc 0a 00 00 00 	movl   $0x0,0xafc
 778:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 77b:	b9 f8 0a 00 00       	mov    $0xaf8,%ecx
 780:	eb d7                	jmp    759 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 782:	74 1a                	je     79e <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 784:	29 da                	sub    %ebx,%edx
 786:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 789:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 78c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 78f:	89 0d f4 0a 00 00    	mov    %ecx,0xaf4
      return (void*)(p + 1);
 795:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 798:	83 c4 04             	add    $0x4,%esp
 79b:	5b                   	pop    %ebx
 79c:	5d                   	pop    %ebp
 79d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 79e:	8b 10                	mov    (%eax),%edx
 7a0:	89 11                	mov    %edx,(%ecx)
 7a2:	eb eb                	jmp    78f <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a4:	89 c1                	mov    %eax,%ecx
 7a6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7a8:	8b 50 04             	mov    0x4(%eax),%edx
 7ab:	39 da                	cmp    %ebx,%edx
 7ad:	73 d3                	jae    782 <malloc+0x4a>
    if(p == freep)
 7af:	39 05 f4 0a 00 00    	cmp    %eax,0xaf4
 7b5:	75 ed                	jne    7a4 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 7b7:	89 d8                	mov    %ebx,%eax
 7b9:	e8 2a ff ff ff       	call   6e8 <morecore>
 7be:	85 c0                	test   %eax,%eax
 7c0:	75 e2                	jne    7a4 <malloc+0x6c>
 7c2:	eb d4                	jmp    798 <malloc+0x60>
