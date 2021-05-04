
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 88 07 00 00       	push   $0x788
  1d:	e8 95 03 00 00       	call   3b7 <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	78 59                	js     82 <main+0x82>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 bc 03 00 00       	call   3ef <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 b0 03 00 00       	call   3ef <dup>
  3f:	83 c4 10             	add    $0x10,%esp

  for(;;){
    printf(1, "init: starting sh\n");
  42:	83 ec 08             	sub    $0x8,%esp
  45:	68 90 07 00 00       	push   $0x790
  4a:	6a 01                	push   $0x1
  4c:	e8 77 04 00 00       	call   4c8 <printf>
    pid = fork();
  51:	e8 19 03 00 00       	call   36f <fork>
  56:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  58:	83 c4 10             	add    $0x10,%esp
  5b:	85 c0                	test   %eax,%eax
  5d:	78 48                	js     a7 <main+0xa7>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  5f:	74 5a                	je     bb <main+0xbb>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  61:	e8 19 03 00 00       	call   37f <wait>
  66:	85 c0                	test   %eax,%eax
  68:	78 d8                	js     42 <main+0x42>
  6a:	39 c3                	cmp    %eax,%ebx
  6c:	74 d4                	je     42 <main+0x42>
      printf(1, "zombie!\n");
  6e:	83 ec 08             	sub    $0x8,%esp
  71:	68 cf 07 00 00       	push   $0x7cf
  76:	6a 01                	push   $0x1
  78:	e8 4b 04 00 00       	call   4c8 <printf>
  7d:	83 c4 10             	add    $0x10,%esp
  80:	eb df                	jmp    61 <main+0x61>
    mknod("console", 1, 1);
  82:	83 ec 04             	sub    $0x4,%esp
  85:	6a 01                	push   $0x1
  87:	6a 01                	push   $0x1
  89:	68 88 07 00 00       	push   $0x788
  8e:	e8 2c 03 00 00       	call   3bf <mknod>
    open("console", O_RDWR);
  93:	83 c4 08             	add    $0x8,%esp
  96:	6a 02                	push   $0x2
  98:	68 88 07 00 00       	push   $0x788
  9d:	e8 15 03 00 00       	call   3b7 <open>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	eb 82                	jmp    29 <main+0x29>
      printf(1, "init: fork failed\n");
  a7:	83 ec 08             	sub    $0x8,%esp
  aa:	68 a3 07 00 00       	push   $0x7a3
  af:	6a 01                	push   $0x1
  b1:	e8 12 04 00 00       	call   4c8 <printf>
      exit();
  b6:	e8 bc 02 00 00       	call   377 <exit>
      exec("sh", argv);
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 e0 0a 00 00       	push   $0xae0
  c3:	68 b6 07 00 00       	push   $0x7b6
  c8:	e8 e2 02 00 00       	call   3af <exec>
      printf(1, "init: exec sh failed\n");
  cd:	83 c4 08             	add    $0x8,%esp
  d0:	68 b9 07 00 00       	push   $0x7b9
  d5:	6a 01                	push   $0x1
  d7:	e8 ec 03 00 00       	call   4c8 <printf>
      exit();
  dc:	e8 96 02 00 00       	call   377 <exit>

000000e1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  e1:	f3 0f 1e fb          	endbr32 
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	56                   	push   %esi
  e9:	53                   	push   %ebx
  ea:	8b 75 08             	mov    0x8(%ebp),%esi
  ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f0:	89 f0                	mov    %esi,%eax
  f2:	89 d1                	mov    %edx,%ecx
  f4:	83 c2 01             	add    $0x1,%edx
  f7:	89 c3                	mov    %eax,%ebx
  f9:	83 c0 01             	add    $0x1,%eax
  fc:	0f b6 09             	movzbl (%ecx),%ecx
  ff:	88 0b                	mov    %cl,(%ebx)
 101:	84 c9                	test   %cl,%cl
 103:	75 ed                	jne    f2 <strcpy+0x11>
    ;
  return os;
}
 105:	89 f0                	mov    %esi,%eax
 107:	5b                   	pop    %ebx
 108:	5e                   	pop    %esi
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    

0000010b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10b:	f3 0f 1e fb          	endbr32 
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	8b 4d 08             	mov    0x8(%ebp),%ecx
 115:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 118:	0f b6 01             	movzbl (%ecx),%eax
 11b:	84 c0                	test   %al,%al
 11d:	74 0c                	je     12b <strcmp+0x20>
 11f:	3a 02                	cmp    (%edx),%al
 121:	75 08                	jne    12b <strcmp+0x20>
    p++, q++;
 123:	83 c1 01             	add    $0x1,%ecx
 126:	83 c2 01             	add    $0x1,%edx
 129:	eb ed                	jmp    118 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 12b:	0f b6 c0             	movzbl %al,%eax
 12e:	0f b6 12             	movzbl (%edx),%edx
 131:	29 d0                	sub    %edx,%eax
}
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strlen>:

uint
strlen(char *s)
{
 135:	f3 0f 1e fb          	endbr32 
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 13f:	b8 00 00 00 00       	mov    $0x0,%eax
 144:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 148:	74 05                	je     14f <strlen+0x1a>
 14a:	83 c0 01             	add    $0x1,%eax
 14d:	eb f5                	jmp    144 <strlen+0xf>
    ;
  return n;
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <memset>:

void*
memset(void *dst, int c, uint n)
{
 151:	f3 0f 1e fb          	endbr32 
 155:	55                   	push   %ebp
 156:	89 e5                	mov    %esp,%ebp
 158:	57                   	push   %edi
 159:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 15c:	89 d7                	mov    %edx,%edi
 15e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 161:	8b 45 0c             	mov    0xc(%ebp),%eax
 164:	fc                   	cld    
 165:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 167:	89 d0                	mov    %edx,%eax
 169:	5f                   	pop    %edi
 16a:	5d                   	pop    %ebp
 16b:	c3                   	ret    

0000016c <strchr>:

char*
strchr(const char *s, char c)
{
 16c:	f3 0f 1e fb          	endbr32 
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	74 09                	je     18a <strchr+0x1e>
    if(*s == c)
 181:	38 ca                	cmp    %cl,%dl
 183:	74 0a                	je     18f <strchr+0x23>
  for(; *s; s++)
 185:	83 c0 01             	add    $0x1,%eax
 188:	eb f0                	jmp    17a <strchr+0xe>
      return (char*)s;
  return 0;
 18a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    

00000191 <gets>:

char*
gets(char *buf, int max)
{
 191:	f3 0f 1e fb          	endbr32 
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
 198:	57                   	push   %edi
 199:	56                   	push   %esi
 19a:	53                   	push   %ebx
 19b:	83 ec 1c             	sub    $0x1c,%esp
 19e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a1:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a6:	89 de                	mov    %ebx,%esi
 1a8:	83 c3 01             	add    $0x1,%ebx
 1ab:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ae:	7d 2e                	jge    1de <gets+0x4d>
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b8:	50                   	push   %eax
 1b9:	6a 00                	push   $0x0
 1bb:	e8 cf 01 00 00       	call   38f <read>
    if(cc < 1)
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	85 c0                	test   %eax,%eax
 1c5:	7e 17                	jle    1de <gets+0x4d>
      break;
    buf[i++] = c;
 1c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1cb:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1ce:	3c 0a                	cmp    $0xa,%al
 1d0:	0f 94 c2             	sete   %dl
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	0f 94 c0             	sete   %al
 1d8:	08 c2                	or     %al,%dl
 1da:	74 ca                	je     1a6 <gets+0x15>
    buf[i++] = c;
 1dc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1de:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e2:	89 f8                	mov    %edi,%eax
 1e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e7:	5b                   	pop    %ebx
 1e8:	5e                   	pop    %esi
 1e9:	5f                   	pop    %edi
 1ea:	5d                   	pop    %ebp
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	f3 0f 1e fb          	endbr32 
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 b5 01 00 00       	call   3b7 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 24                	js     22d <stat+0x41>
 209:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20b:	83 ec 08             	sub    $0x8,%esp
 20e:	ff 75 0c             	pushl  0xc(%ebp)
 211:	50                   	push   %eax
 212:	e8 b8 01 00 00       	call   3cf <fstat>
 217:	89 c6                	mov    %eax,%esi
  close(fd);
 219:	89 1c 24             	mov    %ebx,(%esp)
 21c:	e8 7e 01 00 00       	call   39f <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	89 f0                	mov    %esi,%eax
 226:	8d 65 f8             	lea    -0x8(%ebp),%esp
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
    return -1;
 22d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 232:	eb f0                	jmp    224 <stat+0x38>

00000234 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 234:	f3 0f 1e fb          	endbr32 
 238:	55                   	push   %ebp
 239:	89 e5                	mov    %esp,%ebp
 23b:	57                   	push   %edi
 23c:	56                   	push   %esi
 23d:	53                   	push   %ebx
 23e:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 241:	0f b6 02             	movzbl (%edx),%eax
 244:	3c 20                	cmp    $0x20,%al
 246:	75 05                	jne    24d <atoi+0x19>
 248:	83 c2 01             	add    $0x1,%edx
 24b:	eb f4                	jmp    241 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 24d:	3c 2d                	cmp    $0x2d,%al
 24f:	74 1d                	je     26e <atoi+0x3a>
 251:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 256:	3c 2b                	cmp    $0x2b,%al
 258:	0f 94 c1             	sete   %cl
 25b:	3c 2d                	cmp    $0x2d,%al
 25d:	0f 94 c0             	sete   %al
 260:	08 c1                	or     %al,%cl
 262:	74 03                	je     267 <atoi+0x33>
    s++;
 264:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 267:	b8 00 00 00 00       	mov    $0x0,%eax
 26c:	eb 17                	jmp    285 <atoi+0x51>
 26e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 273:	eb e1                	jmp    256 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 275:	8d 34 80             	lea    (%eax,%eax,4),%esi
 278:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 27b:	83 c2 01             	add    $0x1,%edx
 27e:	0f be c9             	movsbl %cl,%ecx
 281:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 285:	0f b6 0a             	movzbl (%edx),%ecx
 288:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 28b:	80 fb 09             	cmp    $0x9,%bl
 28e:	76 e5                	jbe    275 <atoi+0x41>
  return sign*n;
 290:	0f af c7             	imul   %edi,%eax
}
 293:	5b                   	pop    %ebx
 294:	5e                   	pop    %esi
 295:	5f                   	pop    %edi
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    

00000298 <atoo>:

int
atoo(const char *s)
{
 298:	f3 0f 1e fb          	endbr32 
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	57                   	push   %edi
 2a0:	56                   	push   %esi
 2a1:	53                   	push   %ebx
 2a2:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 2a5:	0f b6 0a             	movzbl (%edx),%ecx
 2a8:	80 f9 20             	cmp    $0x20,%cl
 2ab:	75 05                	jne    2b2 <atoo+0x1a>
 2ad:	83 c2 01             	add    $0x1,%edx
 2b0:	eb f3                	jmp    2a5 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 2b2:	80 f9 2d             	cmp    $0x2d,%cl
 2b5:	74 23                	je     2da <atoo+0x42>
 2b7:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 2bc:	80 f9 2b             	cmp    $0x2b,%cl
 2bf:	0f 94 c0             	sete   %al
 2c2:	89 c6                	mov    %eax,%esi
 2c4:	80 f9 2d             	cmp    $0x2d,%cl
 2c7:	0f 94 c0             	sete   %al
 2ca:	89 f3                	mov    %esi,%ebx
 2cc:	08 c3                	or     %al,%bl
 2ce:	74 03                	je     2d3 <atoo+0x3b>
    s++;
 2d0:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 2d3:	b8 00 00 00 00       	mov    $0x0,%eax
 2d8:	eb 11                	jmp    2eb <atoo+0x53>
 2da:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 2df:	eb db                	jmp    2bc <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 2e1:	83 c2 01             	add    $0x1,%edx
 2e4:	0f be c9             	movsbl %cl,%ecx
 2e7:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 2eb:	0f b6 0a             	movzbl (%edx),%ecx
 2ee:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 2f1:	80 fb 07             	cmp    $0x7,%bl
 2f4:	76 eb                	jbe    2e1 <atoo+0x49>
  return sign*n;
 2f6:	0f af c7             	imul   %edi,%eax
}
 2f9:	5b                   	pop    %ebx
 2fa:	5e                   	pop    %esi
 2fb:	5f                   	pop    %edi
 2fc:	5d                   	pop    %ebp
 2fd:	c3                   	ret    

000002fe <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 2fe:	f3 0f 1e fb          	endbr32 
 302:	55                   	push   %ebp
 303:	89 e5                	mov    %esp,%ebp
 305:	53                   	push   %ebx
 306:	8b 55 08             	mov    0x8(%ebp),%edx
 309:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 30c:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 30f:	eb 09                	jmp    31a <strncmp+0x1c>
      n--, p++, q++;
 311:	83 e8 01             	sub    $0x1,%eax
 314:	83 c2 01             	add    $0x1,%edx
 317:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 31a:	85 c0                	test   %eax,%eax
 31c:	74 0b                	je     329 <strncmp+0x2b>
 31e:	0f b6 1a             	movzbl (%edx),%ebx
 321:	84 db                	test   %bl,%bl
 323:	74 04                	je     329 <strncmp+0x2b>
 325:	3a 19                	cmp    (%ecx),%bl
 327:	74 e8                	je     311 <strncmp+0x13>
    if(n == 0)
 329:	85 c0                	test   %eax,%eax
 32b:	74 0b                	je     338 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 32d:	0f b6 02             	movzbl (%edx),%eax
 330:	0f b6 11             	movzbl (%ecx),%edx
 333:	29 d0                	sub    %edx,%eax
}
 335:	5b                   	pop    %ebx
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
      return 0;
 338:	b8 00 00 00 00       	mov    $0x0,%eax
 33d:	eb f6                	jmp    335 <strncmp+0x37>

0000033f <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 33f:	f3 0f 1e fb          	endbr32 
 343:	55                   	push   %ebp
 344:	89 e5                	mov    %esp,%ebp
 346:	56                   	push   %esi
 347:	53                   	push   %ebx
 348:	8b 75 08             	mov    0x8(%ebp),%esi
 34b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 34e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 351:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 353:	8d 58 ff             	lea    -0x1(%eax),%ebx
 356:	85 c0                	test   %eax,%eax
 358:	7e 0f                	jle    369 <memmove+0x2a>
    *dst++ = *src++;
 35a:	0f b6 01             	movzbl (%ecx),%eax
 35d:	88 02                	mov    %al,(%edx)
 35f:	8d 49 01             	lea    0x1(%ecx),%ecx
 362:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 365:	89 d8                	mov    %ebx,%eax
 367:	eb ea                	jmp    353 <memmove+0x14>
  return vdst;
}
 369:	89 f0                	mov    %esi,%eax
 36b:	5b                   	pop    %ebx
 36c:	5e                   	pop    %esi
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    

0000036f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 36f:	b8 01 00 00 00       	mov    $0x1,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <exit>:
SYSCALL(exit)
 377:	b8 02 00 00 00       	mov    $0x2,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <wait>:
SYSCALL(wait)
 37f:	b8 03 00 00 00       	mov    $0x3,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <pipe>:
SYSCALL(pipe)
 387:	b8 04 00 00 00       	mov    $0x4,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <read>:
SYSCALL(read)
 38f:	b8 05 00 00 00       	mov    $0x5,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <write>:
SYSCALL(write)
 397:	b8 10 00 00 00       	mov    $0x10,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <close>:
SYSCALL(close)
 39f:	b8 15 00 00 00       	mov    $0x15,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <kill>:
SYSCALL(kill)
 3a7:	b8 06 00 00 00       	mov    $0x6,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <exec>:
SYSCALL(exec)
 3af:	b8 07 00 00 00       	mov    $0x7,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <open>:
SYSCALL(open)
 3b7:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <mknod>:
SYSCALL(mknod)
 3bf:	b8 11 00 00 00       	mov    $0x11,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <unlink>:
SYSCALL(unlink)
 3c7:	b8 12 00 00 00       	mov    $0x12,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <fstat>:
SYSCALL(fstat)
 3cf:	b8 08 00 00 00       	mov    $0x8,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <link>:
SYSCALL(link)
 3d7:	b8 13 00 00 00       	mov    $0x13,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <mkdir>:
SYSCALL(mkdir)
 3df:	b8 14 00 00 00       	mov    $0x14,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <chdir>:
SYSCALL(chdir)
 3e7:	b8 09 00 00 00       	mov    $0x9,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <dup>:
SYSCALL(dup)
 3ef:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <getpid>:
SYSCALL(getpid)
 3f7:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <sbrk>:
SYSCALL(sbrk)
 3ff:	b8 0c 00 00 00       	mov    $0xc,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <sleep>:
SYSCALL(sleep)
 407:	b8 0d 00 00 00       	mov    $0xd,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <uptime>:
SYSCALL(uptime)
 40f:	b8 0e 00 00 00       	mov    $0xe,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <halt>:
SYSCALL(halt)
 417:	b8 16 00 00 00       	mov    $0x16,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <date>:
SYSCALL(date)
 41f:	b8 17 00 00 00       	mov    $0x17,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 427:	55                   	push   %ebp
 428:	89 e5                	mov    %esp,%ebp
 42a:	83 ec 1c             	sub    $0x1c,%esp
 42d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 430:	6a 01                	push   $0x1
 432:	8d 55 f4             	lea    -0xc(%ebp),%edx
 435:	52                   	push   %edx
 436:	50                   	push   %eax
 437:	e8 5b ff ff ff       	call   397 <write>
}
 43c:	83 c4 10             	add    $0x10,%esp
 43f:	c9                   	leave  
 440:	c3                   	ret    

00000441 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 441:	55                   	push   %ebp
 442:	89 e5                	mov    %esp,%ebp
 444:	57                   	push   %edi
 445:	56                   	push   %esi
 446:	53                   	push   %ebx
 447:	83 ec 2c             	sub    $0x2c,%esp
 44a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 44d:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 44f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 453:	0f 95 c2             	setne  %dl
 456:	89 f0                	mov    %esi,%eax
 458:	c1 e8 1f             	shr    $0x1f,%eax
 45b:	84 c2                	test   %al,%dl
 45d:	74 42                	je     4a1 <printint+0x60>
    neg = 1;
    x = -xx;
 45f:	f7 de                	neg    %esi
    neg = 1;
 461:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 468:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 46d:	89 f0                	mov    %esi,%eax
 46f:	ba 00 00 00 00       	mov    $0x0,%edx
 474:	f7 f1                	div    %ecx
 476:	89 df                	mov    %ebx,%edi
 478:	83 c3 01             	add    $0x1,%ebx
 47b:	0f b6 92 e0 07 00 00 	movzbl 0x7e0(%edx),%edx
 482:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 486:	89 f2                	mov    %esi,%edx
 488:	89 c6                	mov    %eax,%esi
 48a:	39 d1                	cmp    %edx,%ecx
 48c:	76 df                	jbe    46d <printint+0x2c>
  if(neg)
 48e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 492:	74 2f                	je     4c3 <printint+0x82>
    buf[i++] = '-';
 494:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 499:	8d 5f 02             	lea    0x2(%edi),%ebx
 49c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 49f:	eb 15                	jmp    4b6 <printint+0x75>
  neg = 0;
 4a1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4a8:	eb be                	jmp    468 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 4aa:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4af:	89 f0                	mov    %esi,%eax
 4b1:	e8 71 ff ff ff       	call   427 <putc>
  while(--i >= 0)
 4b6:	83 eb 01             	sub    $0x1,%ebx
 4b9:	79 ef                	jns    4aa <printint+0x69>
}
 4bb:	83 c4 2c             	add    $0x2c,%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4c6:	eb ee                	jmp    4b6 <printint+0x75>

000004c8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4c8:	f3 0f 1e fb          	endbr32 
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	53                   	push   %ebx
 4d2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4d5:	8d 45 10             	lea    0x10(%ebp),%eax
 4d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4db:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4e0:	bb 00 00 00 00       	mov    $0x0,%ebx
 4e5:	eb 14                	jmp    4fb <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4e7:	89 fa                	mov    %edi,%edx
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	e8 36 ff ff ff       	call   427 <putc>
 4f1:	eb 05                	jmp    4f8 <printf+0x30>
      }
    } else if(state == '%'){
 4f3:	83 fe 25             	cmp    $0x25,%esi
 4f6:	74 25                	je     51d <printf+0x55>
  for(i = 0; fmt[i]; i++){
 4f8:	83 c3 01             	add    $0x1,%ebx
 4fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fe:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 502:	84 c0                	test   %al,%al
 504:	0f 84 23 01 00 00    	je     62d <printf+0x165>
    c = fmt[i] & 0xff;
 50a:	0f be f8             	movsbl %al,%edi
 50d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 510:	85 f6                	test   %esi,%esi
 512:	75 df                	jne    4f3 <printf+0x2b>
      if(c == '%'){
 514:	83 f8 25             	cmp    $0x25,%eax
 517:	75 ce                	jne    4e7 <printf+0x1f>
        state = '%';
 519:	89 c6                	mov    %eax,%esi
 51b:	eb db                	jmp    4f8 <printf+0x30>
      if(c == 'd'){
 51d:	83 f8 64             	cmp    $0x64,%eax
 520:	74 49                	je     56b <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 522:	83 f8 78             	cmp    $0x78,%eax
 525:	0f 94 c1             	sete   %cl
 528:	83 f8 70             	cmp    $0x70,%eax
 52b:	0f 94 c2             	sete   %dl
 52e:	08 d1                	or     %dl,%cl
 530:	75 63                	jne    595 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 532:	83 f8 73             	cmp    $0x73,%eax
 535:	0f 84 84 00 00 00    	je     5bf <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 53b:	83 f8 63             	cmp    $0x63,%eax
 53e:	0f 84 b7 00 00 00    	je     5fb <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 544:	83 f8 25             	cmp    $0x25,%eax
 547:	0f 84 cc 00 00 00    	je     619 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 54d:	ba 25 00 00 00       	mov    $0x25,%edx
 552:	8b 45 08             	mov    0x8(%ebp),%eax
 555:	e8 cd fe ff ff       	call   427 <putc>
        putc(fd, c);
 55a:	89 fa                	mov    %edi,%edx
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	e8 c3 fe ff ff       	call   427 <putc>
      }
      state = 0;
 564:	be 00 00 00 00       	mov    $0x0,%esi
 569:	eb 8d                	jmp    4f8 <printf+0x30>
        printint(fd, *ap, 10, 1);
 56b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 56e:	8b 17                	mov    (%edi),%edx
 570:	83 ec 0c             	sub    $0xc,%esp
 573:	6a 01                	push   $0x1
 575:	b9 0a 00 00 00       	mov    $0xa,%ecx
 57a:	8b 45 08             	mov    0x8(%ebp),%eax
 57d:	e8 bf fe ff ff       	call   441 <printint>
        ap++;
 582:	83 c7 04             	add    $0x4,%edi
 585:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 588:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58b:	be 00 00 00 00       	mov    $0x0,%esi
 590:	e9 63 ff ff ff       	jmp    4f8 <printf+0x30>
        printint(fd, *ap, 16, 0);
 595:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 598:	8b 17                	mov    (%edi),%edx
 59a:	83 ec 0c             	sub    $0xc,%esp
 59d:	6a 00                	push   $0x0
 59f:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	e8 95 fe ff ff       	call   441 <printint>
        ap++;
 5ac:	83 c7 04             	add    $0x4,%edi
 5af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5b5:	be 00 00 00 00       	mov    $0x0,%esi
 5ba:	e9 39 ff ff ff       	jmp    4f8 <printf+0x30>
        s = (char*)*ap;
 5bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c2:	8b 30                	mov    (%eax),%esi
        ap++;
 5c4:	83 c0 04             	add    $0x4,%eax
 5c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5ca:	85 f6                	test   %esi,%esi
 5cc:	75 28                	jne    5f6 <printf+0x12e>
          s = "(null)";
 5ce:	be d8 07 00 00       	mov    $0x7d8,%esi
 5d3:	8b 7d 08             	mov    0x8(%ebp),%edi
 5d6:	eb 0d                	jmp    5e5 <printf+0x11d>
          putc(fd, *s);
 5d8:	0f be d2             	movsbl %dl,%edx
 5db:	89 f8                	mov    %edi,%eax
 5dd:	e8 45 fe ff ff       	call   427 <putc>
          s++;
 5e2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5e5:	0f b6 16             	movzbl (%esi),%edx
 5e8:	84 d2                	test   %dl,%dl
 5ea:	75 ec                	jne    5d8 <printf+0x110>
      state = 0;
 5ec:	be 00 00 00 00       	mov    $0x0,%esi
 5f1:	e9 02 ff ff ff       	jmp    4f8 <printf+0x30>
 5f6:	8b 7d 08             	mov    0x8(%ebp),%edi
 5f9:	eb ea                	jmp    5e5 <printf+0x11d>
        putc(fd, *ap);
 5fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5fe:	0f be 17             	movsbl (%edi),%edx
 601:	8b 45 08             	mov    0x8(%ebp),%eax
 604:	e8 1e fe ff ff       	call   427 <putc>
        ap++;
 609:	83 c7 04             	add    $0x4,%edi
 60c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 60f:	be 00 00 00 00       	mov    $0x0,%esi
 614:	e9 df fe ff ff       	jmp    4f8 <printf+0x30>
        putc(fd, c);
 619:	89 fa                	mov    %edi,%edx
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	e8 04 fe ff ff       	call   427 <putc>
      state = 0;
 623:	be 00 00 00 00       	mov    $0x0,%esi
 628:	e9 cb fe ff ff       	jmp    4f8 <printf+0x30>
    }
  }
}
 62d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 630:	5b                   	pop    %ebx
 631:	5e                   	pop    %esi
 632:	5f                   	pop    %edi
 633:	5d                   	pop    %ebp
 634:	c3                   	ret    

00000635 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 635:	f3 0f 1e fb          	endbr32 
 639:	55                   	push   %ebp
 63a:	89 e5                	mov    %esp,%ebp
 63c:	57                   	push   %edi
 63d:	56                   	push   %esi
 63e:	53                   	push   %ebx
 63f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 642:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 645:	a1 e8 0a 00 00       	mov    0xae8,%eax
 64a:	eb 02                	jmp    64e <free+0x19>
 64c:	89 d0                	mov    %edx,%eax
 64e:	39 c8                	cmp    %ecx,%eax
 650:	73 04                	jae    656 <free+0x21>
 652:	39 08                	cmp    %ecx,(%eax)
 654:	77 12                	ja     668 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 656:	8b 10                	mov    (%eax),%edx
 658:	39 c2                	cmp    %eax,%edx
 65a:	77 f0                	ja     64c <free+0x17>
 65c:	39 c8                	cmp    %ecx,%eax
 65e:	72 08                	jb     668 <free+0x33>
 660:	39 ca                	cmp    %ecx,%edx
 662:	77 04                	ja     668 <free+0x33>
 664:	89 d0                	mov    %edx,%eax
 666:	eb e6                	jmp    64e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	8b 10                	mov    (%eax),%edx
 670:	39 d7                	cmp    %edx,%edi
 672:	74 19                	je     68d <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 674:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 677:	8b 50 04             	mov    0x4(%eax),%edx
 67a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67d:	39 ce                	cmp    %ecx,%esi
 67f:	74 1b                	je     69c <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 681:	89 08                	mov    %ecx,(%eax)
  freep = p;
 683:	a3 e8 0a 00 00       	mov    %eax,0xae8
}
 688:	5b                   	pop    %ebx
 689:	5e                   	pop    %esi
 68a:	5f                   	pop    %edi
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 68d:	03 72 04             	add    0x4(%edx),%esi
 690:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 693:	8b 10                	mov    (%eax),%edx
 695:	8b 12                	mov    (%edx),%edx
 697:	89 53 f8             	mov    %edx,-0x8(%ebx)
 69a:	eb db                	jmp    677 <free+0x42>
    p->s.size += bp->s.size;
 69c:	03 53 fc             	add    -0x4(%ebx),%edx
 69f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a5:	89 10                	mov    %edx,(%eax)
 6a7:	eb da                	jmp    683 <free+0x4e>

000006a9 <morecore>:

static Header*
morecore(uint nu)
{
 6a9:	55                   	push   %ebp
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	53                   	push   %ebx
 6ad:	83 ec 04             	sub    $0x4,%esp
 6b0:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6b2:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6b7:	77 05                	ja     6be <morecore+0x15>
    nu = 4096;
 6b9:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6be:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6c5:	83 ec 0c             	sub    $0xc,%esp
 6c8:	50                   	push   %eax
 6c9:	e8 31 fd ff ff       	call   3ff <sbrk>
  if(p == (char*)-1)
 6ce:	83 c4 10             	add    $0x10,%esp
 6d1:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d4:	74 1c                	je     6f2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6d6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6d9:	83 c0 08             	add    $0x8,%eax
 6dc:	83 ec 0c             	sub    $0xc,%esp
 6df:	50                   	push   %eax
 6e0:	e8 50 ff ff ff       	call   635 <free>
  return freep;
 6e5:	a1 e8 0a 00 00       	mov    0xae8,%eax
 6ea:	83 c4 10             	add    $0x10,%esp
}
 6ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f0:	c9                   	leave  
 6f1:	c3                   	ret    
    return 0;
 6f2:	b8 00 00 00 00       	mov    $0x0,%eax
 6f7:	eb f4                	jmp    6ed <morecore+0x44>

000006f9 <malloc>:

void*
malloc(uint nbytes)
{
 6f9:	f3 0f 1e fb          	endbr32 
 6fd:	55                   	push   %ebp
 6fe:	89 e5                	mov    %esp,%ebp
 700:	53                   	push   %ebx
 701:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 704:	8b 45 08             	mov    0x8(%ebp),%eax
 707:	8d 58 07             	lea    0x7(%eax),%ebx
 70a:	c1 eb 03             	shr    $0x3,%ebx
 70d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 710:	8b 0d e8 0a 00 00    	mov    0xae8,%ecx
 716:	85 c9                	test   %ecx,%ecx
 718:	74 04                	je     71e <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 71a:	8b 01                	mov    (%ecx),%eax
 71c:	eb 4b                	jmp    769 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 71e:	c7 05 e8 0a 00 00 ec 	movl   $0xaec,0xae8
 725:	0a 00 00 
 728:	c7 05 ec 0a 00 00 ec 	movl   $0xaec,0xaec
 72f:	0a 00 00 
    base.s.size = 0;
 732:	c7 05 f0 0a 00 00 00 	movl   $0x0,0xaf0
 739:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 73c:	b9 ec 0a 00 00       	mov    $0xaec,%ecx
 741:	eb d7                	jmp    71a <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 743:	74 1a                	je     75f <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 745:	29 da                	sub    %ebx,%edx
 747:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 74a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 74d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 750:	89 0d e8 0a 00 00    	mov    %ecx,0xae8
      return (void*)(p + 1);
 756:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 759:	83 c4 04             	add    $0x4,%esp
 75c:	5b                   	pop    %ebx
 75d:	5d                   	pop    %ebp
 75e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 75f:	8b 10                	mov    (%eax),%edx
 761:	89 11                	mov    %edx,(%ecx)
 763:	eb eb                	jmp    750 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 765:	89 c1                	mov    %eax,%ecx
 767:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 769:	8b 50 04             	mov    0x4(%eax),%edx
 76c:	39 da                	cmp    %ebx,%edx
 76e:	73 d3                	jae    743 <malloc+0x4a>
    if(p == freep)
 770:	39 05 e8 0a 00 00    	cmp    %eax,0xae8
 776:	75 ed                	jne    765 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 778:	89 d8                	mov    %ebx,%eax
 77a:	e8 2a ff ff ff       	call   6a9 <morecore>
 77f:	85 c0                	test   %eax,%eax
 781:	75 e2                	jne    765 <malloc+0x6c>
 783:	eb d4                	jmp    759 <malloc+0x60>
