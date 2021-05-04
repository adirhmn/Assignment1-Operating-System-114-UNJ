
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 31                	mov    (%ecx),%esi
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  1d:	b8 01 00 00 00       	mov    $0x1,%eax
  22:	eb 1a                	jmp    3e <main+0x3e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  24:	ba fc 06 00 00       	mov    $0x6fc,%edx
  29:	52                   	push   %edx
  2a:	ff 34 87             	pushl  (%edi,%eax,4)
  2d:	68 00 07 00 00       	push   $0x700
  32:	6a 01                	push   $0x1
  34:	e8 03 04 00 00       	call   43c <printf>
  39:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  3c:	89 d8                	mov    %ebx,%eax
  3e:	39 f0                	cmp    %esi,%eax
  40:	7d 0e                	jge    50 <main+0x50>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  42:	8d 58 01             	lea    0x1(%eax),%ebx
  45:	39 f3                	cmp    %esi,%ebx
  47:	7d db                	jge    24 <main+0x24>
  49:	ba fe 06 00 00       	mov    $0x6fe,%edx
  4e:	eb d9                	jmp    29 <main+0x29>
  exit();
  50:	e8 96 02 00 00       	call   2eb <exit>

00000055 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  55:	f3 0f 1e fb          	endbr32 
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	56                   	push   %esi
  5d:	53                   	push   %ebx
  5e:	8b 75 08             	mov    0x8(%ebp),%esi
  61:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	89 f0                	mov    %esi,%eax
  66:	89 d1                	mov    %edx,%ecx
  68:	83 c2 01             	add    $0x1,%edx
  6b:	89 c3                	mov    %eax,%ebx
  6d:	83 c0 01             	add    $0x1,%eax
  70:	0f b6 09             	movzbl (%ecx),%ecx
  73:	88 0b                	mov    %cl,(%ebx)
  75:	84 c9                	test   %cl,%cl
  77:	75 ed                	jne    66 <strcpy+0x11>
    ;
  return os;
}
  79:	89 f0                	mov    %esi,%eax
  7b:	5b                   	pop    %ebx
  7c:	5e                   	pop    %esi
  7d:	5d                   	pop    %ebp
  7e:	c3                   	ret    

0000007f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7f:	f3 0f 1e fb          	endbr32 
  83:	55                   	push   %ebp
  84:	89 e5                	mov    %esp,%ebp
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8c:	0f b6 01             	movzbl (%ecx),%eax
  8f:	84 c0                	test   %al,%al
  91:	74 0c                	je     9f <strcmp+0x20>
  93:	3a 02                	cmp    (%edx),%al
  95:	75 08                	jne    9f <strcmp+0x20>
    p++, q++;
  97:	83 c1 01             	add    $0x1,%ecx
  9a:	83 c2 01             	add    $0x1,%edx
  9d:	eb ed                	jmp    8c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  9f:	0f b6 c0             	movzbl %al,%eax
  a2:	0f b6 12             	movzbl (%edx),%edx
  a5:	29 d0                	sub    %edx,%eax
}
  a7:	5d                   	pop    %ebp
  a8:	c3                   	ret    

000000a9 <strlen>:

uint
strlen(char *s)
{
  a9:	f3 0f 1e fb          	endbr32 
  ad:	55                   	push   %ebp
  ae:	89 e5                	mov    %esp,%ebp
  b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  b3:	b8 00 00 00 00       	mov    $0x0,%eax
  b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bc:	74 05                	je     c3 <strlen+0x1a>
  be:	83 c0 01             	add    $0x1,%eax
  c1:	eb f5                	jmp    b8 <strlen+0xf>
    ;
  return n;
}
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    

000000c5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c5:	f3 0f 1e fb          	endbr32 
  c9:	55                   	push   %ebp
  ca:	89 e5                	mov    %esp,%ebp
  cc:	57                   	push   %edi
  cd:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  d0:	89 d7                	mov    %edx,%edi
  d2:	8b 4d 10             	mov    0x10(%ebp),%ecx
  d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  d8:	fc                   	cld    
  d9:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  db:	89 d0                	mov    %edx,%eax
  dd:	5f                   	pop    %edi
  de:	5d                   	pop    %ebp
  df:	c3                   	ret    

000000e0 <strchr>:

char*
strchr(const char *s, char c)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	8b 45 08             	mov    0x8(%ebp),%eax
  ea:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  ee:	0f b6 10             	movzbl (%eax),%edx
  f1:	84 d2                	test   %dl,%dl
  f3:	74 09                	je     fe <strchr+0x1e>
    if(*s == c)
  f5:	38 ca                	cmp    %cl,%dl
  f7:	74 0a                	je     103 <strchr+0x23>
  for(; *s; s++)
  f9:	83 c0 01             	add    $0x1,%eax
  fc:	eb f0                	jmp    ee <strchr+0xe>
      return (char*)s;
  return 0;
  fe:	b8 00 00 00 00       	mov    $0x0,%eax
}
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    

00000105 <gets>:

char*
gets(char *buf, int max)
{
 105:	f3 0f 1e fb          	endbr32 
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	57                   	push   %edi
 10d:	56                   	push   %esi
 10e:	53                   	push   %ebx
 10f:	83 ec 1c             	sub    $0x1c,%esp
 112:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 115:	bb 00 00 00 00       	mov    $0x0,%ebx
 11a:	89 de                	mov    %ebx,%esi
 11c:	83 c3 01             	add    $0x1,%ebx
 11f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 122:	7d 2e                	jge    152 <gets+0x4d>
    cc = read(0, &c, 1);
 124:	83 ec 04             	sub    $0x4,%esp
 127:	6a 01                	push   $0x1
 129:	8d 45 e7             	lea    -0x19(%ebp),%eax
 12c:	50                   	push   %eax
 12d:	6a 00                	push   $0x0
 12f:	e8 cf 01 00 00       	call   303 <read>
    if(cc < 1)
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	7e 17                	jle    152 <gets+0x4d>
      break;
    buf[i++] = c;
 13b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 13f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 142:	3c 0a                	cmp    $0xa,%al
 144:	0f 94 c2             	sete   %dl
 147:	3c 0d                	cmp    $0xd,%al
 149:	0f 94 c0             	sete   %al
 14c:	08 c2                	or     %al,%dl
 14e:	74 ca                	je     11a <gets+0x15>
    buf[i++] = c;
 150:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 152:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 156:	89 f8                	mov    %edi,%eax
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15b:	5b                   	pop    %ebx
 15c:	5e                   	pop    %esi
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <stat>:

int
stat(char *n, struct stat *st)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	56                   	push   %esi
 168:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 169:	83 ec 08             	sub    $0x8,%esp
 16c:	6a 00                	push   $0x0
 16e:	ff 75 08             	pushl  0x8(%ebp)
 171:	e8 b5 01 00 00       	call   32b <open>
  if(fd < 0)
 176:	83 c4 10             	add    $0x10,%esp
 179:	85 c0                	test   %eax,%eax
 17b:	78 24                	js     1a1 <stat+0x41>
 17d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 17f:	83 ec 08             	sub    $0x8,%esp
 182:	ff 75 0c             	pushl  0xc(%ebp)
 185:	50                   	push   %eax
 186:	e8 b8 01 00 00       	call   343 <fstat>
 18b:	89 c6                	mov    %eax,%esi
  close(fd);
 18d:	89 1c 24             	mov    %ebx,(%esp)
 190:	e8 7e 01 00 00       	call   313 <close>
  return r;
 195:	83 c4 10             	add    $0x10,%esp
}
 198:	89 f0                	mov    %esi,%eax
 19a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
    return -1;
 1a1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1a6:	eb f0                	jmp    198 <stat+0x38>

000001a8 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 1a8:	f3 0f 1e fb          	endbr32 
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	57                   	push   %edi
 1b0:	56                   	push   %esi
 1b1:	53                   	push   %ebx
 1b2:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 1b5:	0f b6 02             	movzbl (%edx),%eax
 1b8:	3c 20                	cmp    $0x20,%al
 1ba:	75 05                	jne    1c1 <atoi+0x19>
 1bc:	83 c2 01             	add    $0x1,%edx
 1bf:	eb f4                	jmp    1b5 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 1c1:	3c 2d                	cmp    $0x2d,%al
 1c3:	74 1d                	je     1e2 <atoi+0x3a>
 1c5:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 1ca:	3c 2b                	cmp    $0x2b,%al
 1cc:	0f 94 c1             	sete   %cl
 1cf:	3c 2d                	cmp    $0x2d,%al
 1d1:	0f 94 c0             	sete   %al
 1d4:	08 c1                	or     %al,%cl
 1d6:	74 03                	je     1db <atoi+0x33>
    s++;
 1d8:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 1db:	b8 00 00 00 00       	mov    $0x0,%eax
 1e0:	eb 17                	jmp    1f9 <atoi+0x51>
 1e2:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 1e7:	eb e1                	jmp    1ca <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 1e9:	8d 34 80             	lea    (%eax,%eax,4),%esi
 1ec:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 1ef:	83 c2 01             	add    $0x1,%edx
 1f2:	0f be c9             	movsbl %cl,%ecx
 1f5:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 1f9:	0f b6 0a             	movzbl (%edx),%ecx
 1fc:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 1ff:	80 fb 09             	cmp    $0x9,%bl
 202:	76 e5                	jbe    1e9 <atoi+0x41>
  return sign*n;
 204:	0f af c7             	imul   %edi,%eax
}
 207:	5b                   	pop    %ebx
 208:	5e                   	pop    %esi
 209:	5f                   	pop    %edi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    

0000020c <atoo>:

int
atoo(const char *s)
{
 20c:	f3 0f 1e fb          	endbr32 
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
 216:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 219:	0f b6 0a             	movzbl (%edx),%ecx
 21c:	80 f9 20             	cmp    $0x20,%cl
 21f:	75 05                	jne    226 <atoo+0x1a>
 221:	83 c2 01             	add    $0x1,%edx
 224:	eb f3                	jmp    219 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 226:	80 f9 2d             	cmp    $0x2d,%cl
 229:	74 23                	je     24e <atoo+0x42>
 22b:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 230:	80 f9 2b             	cmp    $0x2b,%cl
 233:	0f 94 c0             	sete   %al
 236:	89 c6                	mov    %eax,%esi
 238:	80 f9 2d             	cmp    $0x2d,%cl
 23b:	0f 94 c0             	sete   %al
 23e:	89 f3                	mov    %esi,%ebx
 240:	08 c3                	or     %al,%bl
 242:	74 03                	je     247 <atoo+0x3b>
    s++;
 244:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 247:	b8 00 00 00 00       	mov    $0x0,%eax
 24c:	eb 11                	jmp    25f <atoo+0x53>
 24e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 253:	eb db                	jmp    230 <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 255:	83 c2 01             	add    $0x1,%edx
 258:	0f be c9             	movsbl %cl,%ecx
 25b:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 25f:	0f b6 0a             	movzbl (%edx),%ecx
 262:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 265:	80 fb 07             	cmp    $0x7,%bl
 268:	76 eb                	jbe    255 <atoo+0x49>
  return sign*n;
 26a:	0f af c7             	imul   %edi,%eax
}
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5f                   	pop    %edi
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 272:	f3 0f 1e fb          	endbr32 
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	53                   	push   %ebx
 27a:	8b 55 08             	mov    0x8(%ebp),%edx
 27d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 280:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 283:	eb 09                	jmp    28e <strncmp+0x1c>
      n--, p++, q++;
 285:	83 e8 01             	sub    $0x1,%eax
 288:	83 c2 01             	add    $0x1,%edx
 28b:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 28e:	85 c0                	test   %eax,%eax
 290:	74 0b                	je     29d <strncmp+0x2b>
 292:	0f b6 1a             	movzbl (%edx),%ebx
 295:	84 db                	test   %bl,%bl
 297:	74 04                	je     29d <strncmp+0x2b>
 299:	3a 19                	cmp    (%ecx),%bl
 29b:	74 e8                	je     285 <strncmp+0x13>
    if(n == 0)
 29d:	85 c0                	test   %eax,%eax
 29f:	74 0b                	je     2ac <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 2a1:	0f b6 02             	movzbl (%edx),%eax
 2a4:	0f b6 11             	movzbl (%ecx),%edx
 2a7:	29 d0                	sub    %edx,%eax
}
 2a9:	5b                   	pop    %ebx
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
      return 0;
 2ac:	b8 00 00 00 00       	mov    $0x0,%eax
 2b1:	eb f6                	jmp    2a9 <strncmp+0x37>

000002b3 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b3:	f3 0f 1e fb          	endbr32 
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	56                   	push   %esi
 2bb:	53                   	push   %ebx
 2bc:	8b 75 08             	mov    0x8(%ebp),%esi
 2bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2c2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 2c5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2c7:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2ca:	85 c0                	test   %eax,%eax
 2cc:	7e 0f                	jle    2dd <memmove+0x2a>
    *dst++ = *src++;
 2ce:	0f b6 01             	movzbl (%ecx),%eax
 2d1:	88 02                	mov    %al,(%edx)
 2d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 2d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2d9:	89 d8                	mov    %ebx,%eax
 2db:	eb ea                	jmp    2c7 <memmove+0x14>
  return vdst;
}
 2dd:	89 f0                	mov    %esi,%eax
 2df:	5b                   	pop    %ebx
 2e0:	5e                   	pop    %esi
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    

000002e3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e3:	b8 01 00 00 00       	mov    $0x1,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exit>:
SYSCALL(exit)
 2eb:	b8 02 00 00 00       	mov    $0x2,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <wait>:
SYSCALL(wait)
 2f3:	b8 03 00 00 00       	mov    $0x3,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <pipe>:
SYSCALL(pipe)
 2fb:	b8 04 00 00 00       	mov    $0x4,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <read>:
SYSCALL(read)
 303:	b8 05 00 00 00       	mov    $0x5,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <write>:
SYSCALL(write)
 30b:	b8 10 00 00 00       	mov    $0x10,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <close>:
SYSCALL(close)
 313:	b8 15 00 00 00       	mov    $0x15,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <kill>:
SYSCALL(kill)
 31b:	b8 06 00 00 00       	mov    $0x6,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <exec>:
SYSCALL(exec)
 323:	b8 07 00 00 00       	mov    $0x7,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <open>:
SYSCALL(open)
 32b:	b8 0f 00 00 00       	mov    $0xf,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <mknod>:
SYSCALL(mknod)
 333:	b8 11 00 00 00       	mov    $0x11,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <unlink>:
SYSCALL(unlink)
 33b:	b8 12 00 00 00       	mov    $0x12,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <fstat>:
SYSCALL(fstat)
 343:	b8 08 00 00 00       	mov    $0x8,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <link>:
SYSCALL(link)
 34b:	b8 13 00 00 00       	mov    $0x13,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <mkdir>:
SYSCALL(mkdir)
 353:	b8 14 00 00 00       	mov    $0x14,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <chdir>:
SYSCALL(chdir)
 35b:	b8 09 00 00 00       	mov    $0x9,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <dup>:
SYSCALL(dup)
 363:	b8 0a 00 00 00       	mov    $0xa,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <getpid>:
SYSCALL(getpid)
 36b:	b8 0b 00 00 00       	mov    $0xb,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <sbrk>:
SYSCALL(sbrk)
 373:	b8 0c 00 00 00       	mov    $0xc,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <sleep>:
SYSCALL(sleep)
 37b:	b8 0d 00 00 00       	mov    $0xd,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <uptime>:
SYSCALL(uptime)
 383:	b8 0e 00 00 00       	mov    $0xe,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <halt>:
SYSCALL(halt)
 38b:	b8 16 00 00 00       	mov    $0x16,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <date>:
SYSCALL(date)
 393:	b8 17 00 00 00       	mov    $0x17,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	83 ec 1c             	sub    $0x1c,%esp
 3a1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3a4:	6a 01                	push   $0x1
 3a6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3a9:	52                   	push   %edx
 3aa:	50                   	push   %eax
 3ab:	e8 5b ff ff ff       	call   30b <write>
}
 3b0:	83 c4 10             	add    $0x10,%esp
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    

000003b5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
 3b8:	57                   	push   %edi
 3b9:	56                   	push   %esi
 3ba:	53                   	push   %ebx
 3bb:	83 ec 2c             	sub    $0x2c,%esp
 3be:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3c1:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3c3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3c7:	0f 95 c2             	setne  %dl
 3ca:	89 f0                	mov    %esi,%eax
 3cc:	c1 e8 1f             	shr    $0x1f,%eax
 3cf:	84 c2                	test   %al,%dl
 3d1:	74 42                	je     415 <printint+0x60>
    neg = 1;
    x = -xx;
 3d3:	f7 de                	neg    %esi
    neg = 1;
 3d5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3dc:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3e1:	89 f0                	mov    %esi,%eax
 3e3:	ba 00 00 00 00       	mov    $0x0,%edx
 3e8:	f7 f1                	div    %ecx
 3ea:	89 df                	mov    %ebx,%edi
 3ec:	83 c3 01             	add    $0x1,%ebx
 3ef:	0f b6 92 0c 07 00 00 	movzbl 0x70c(%edx),%edx
 3f6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3fa:	89 f2                	mov    %esi,%edx
 3fc:	89 c6                	mov    %eax,%esi
 3fe:	39 d1                	cmp    %edx,%ecx
 400:	76 df                	jbe    3e1 <printint+0x2c>
  if(neg)
 402:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 406:	74 2f                	je     437 <printint+0x82>
    buf[i++] = '-';
 408:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 40d:	8d 5f 02             	lea    0x2(%edi),%ebx
 410:	8b 75 d0             	mov    -0x30(%ebp),%esi
 413:	eb 15                	jmp    42a <printint+0x75>
  neg = 0;
 415:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 41c:	eb be                	jmp    3dc <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 41e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 423:	89 f0                	mov    %esi,%eax
 425:	e8 71 ff ff ff       	call   39b <putc>
  while(--i >= 0)
 42a:	83 eb 01             	sub    $0x1,%ebx
 42d:	79 ef                	jns    41e <printint+0x69>
}
 42f:	83 c4 2c             	add    $0x2c,%esp
 432:	5b                   	pop    %ebx
 433:	5e                   	pop    %esi
 434:	5f                   	pop    %edi
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    
 437:	8b 75 d0             	mov    -0x30(%ebp),%esi
 43a:	eb ee                	jmp    42a <printint+0x75>

0000043c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 43c:	f3 0f 1e fb          	endbr32 
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 449:	8d 45 10             	lea    0x10(%ebp),%eax
 44c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 44f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 454:	bb 00 00 00 00       	mov    $0x0,%ebx
 459:	eb 14                	jmp    46f <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 45b:	89 fa                	mov    %edi,%edx
 45d:	8b 45 08             	mov    0x8(%ebp),%eax
 460:	e8 36 ff ff ff       	call   39b <putc>
 465:	eb 05                	jmp    46c <printf+0x30>
      }
    } else if(state == '%'){
 467:	83 fe 25             	cmp    $0x25,%esi
 46a:	74 25                	je     491 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 46c:	83 c3 01             	add    $0x1,%ebx
 46f:	8b 45 0c             	mov    0xc(%ebp),%eax
 472:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 476:	84 c0                	test   %al,%al
 478:	0f 84 23 01 00 00    	je     5a1 <printf+0x165>
    c = fmt[i] & 0xff;
 47e:	0f be f8             	movsbl %al,%edi
 481:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 484:	85 f6                	test   %esi,%esi
 486:	75 df                	jne    467 <printf+0x2b>
      if(c == '%'){
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	75 ce                	jne    45b <printf+0x1f>
        state = '%';
 48d:	89 c6                	mov    %eax,%esi
 48f:	eb db                	jmp    46c <printf+0x30>
      if(c == 'd'){
 491:	83 f8 64             	cmp    $0x64,%eax
 494:	74 49                	je     4df <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 496:	83 f8 78             	cmp    $0x78,%eax
 499:	0f 94 c1             	sete   %cl
 49c:	83 f8 70             	cmp    $0x70,%eax
 49f:	0f 94 c2             	sete   %dl
 4a2:	08 d1                	or     %dl,%cl
 4a4:	75 63                	jne    509 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4a6:	83 f8 73             	cmp    $0x73,%eax
 4a9:	0f 84 84 00 00 00    	je     533 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4af:	83 f8 63             	cmp    $0x63,%eax
 4b2:	0f 84 b7 00 00 00    	je     56f <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	0f 84 cc 00 00 00    	je     58d <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4c1:	ba 25 00 00 00       	mov    $0x25,%edx
 4c6:	8b 45 08             	mov    0x8(%ebp),%eax
 4c9:	e8 cd fe ff ff       	call   39b <putc>
        putc(fd, c);
 4ce:	89 fa                	mov    %edi,%edx
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
 4d3:	e8 c3 fe ff ff       	call   39b <putc>
      }
      state = 0;
 4d8:	be 00 00 00 00       	mov    $0x0,%esi
 4dd:	eb 8d                	jmp    46c <printf+0x30>
        printint(fd, *ap, 10, 1);
 4df:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e2:	8b 17                	mov    (%edi),%edx
 4e4:	83 ec 0c             	sub    $0xc,%esp
 4e7:	6a 01                	push   $0x1
 4e9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	e8 bf fe ff ff       	call   3b5 <printint>
        ap++;
 4f6:	83 c7 04             	add    $0x4,%edi
 4f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ff:	be 00 00 00 00       	mov    $0x0,%esi
 504:	e9 63 ff ff ff       	jmp    46c <printf+0x30>
        printint(fd, *ap, 16, 0);
 509:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50c:	8b 17                	mov    (%edi),%edx
 50e:	83 ec 0c             	sub    $0xc,%esp
 511:	6a 00                	push   $0x0
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	e8 95 fe ff ff       	call   3b5 <printint>
        ap++;
 520:	83 c7 04             	add    $0x4,%edi
 523:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 526:	83 c4 10             	add    $0x10,%esp
      state = 0;
 529:	be 00 00 00 00       	mov    $0x0,%esi
 52e:	e9 39 ff ff ff       	jmp    46c <printf+0x30>
        s = (char*)*ap;
 533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 536:	8b 30                	mov    (%eax),%esi
        ap++;
 538:	83 c0 04             	add    $0x4,%eax
 53b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 53e:	85 f6                	test   %esi,%esi
 540:	75 28                	jne    56a <printf+0x12e>
          s = "(null)";
 542:	be 05 07 00 00       	mov    $0x705,%esi
 547:	8b 7d 08             	mov    0x8(%ebp),%edi
 54a:	eb 0d                	jmp    559 <printf+0x11d>
          putc(fd, *s);
 54c:	0f be d2             	movsbl %dl,%edx
 54f:	89 f8                	mov    %edi,%eax
 551:	e8 45 fe ff ff       	call   39b <putc>
          s++;
 556:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 559:	0f b6 16             	movzbl (%esi),%edx
 55c:	84 d2                	test   %dl,%dl
 55e:	75 ec                	jne    54c <printf+0x110>
      state = 0;
 560:	be 00 00 00 00       	mov    $0x0,%esi
 565:	e9 02 ff ff ff       	jmp    46c <printf+0x30>
 56a:	8b 7d 08             	mov    0x8(%ebp),%edi
 56d:	eb ea                	jmp    559 <printf+0x11d>
        putc(fd, *ap);
 56f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 572:	0f be 17             	movsbl (%edi),%edx
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	e8 1e fe ff ff       	call   39b <putc>
        ap++;
 57d:	83 c7 04             	add    $0x4,%edi
 580:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 583:	be 00 00 00 00       	mov    $0x0,%esi
 588:	e9 df fe ff ff       	jmp    46c <printf+0x30>
        putc(fd, c);
 58d:	89 fa                	mov    %edi,%edx
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	e8 04 fe ff ff       	call   39b <putc>
      state = 0;
 597:	be 00 00 00 00       	mov    $0x0,%esi
 59c:	e9 cb fe ff ff       	jmp    46c <printf+0x30>
    }
  }
}
 5a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a4:	5b                   	pop    %ebx
 5a5:	5e                   	pop    %esi
 5a6:	5f                   	pop    %edi
 5a7:	5d                   	pop    %ebp
 5a8:	c3                   	ret    

000005a9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5a9:	f3 0f 1e fb          	endbr32 
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	57                   	push   %edi
 5b1:	56                   	push   %esi
 5b2:	53                   	push   %ebx
 5b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b9:	a1 14 0a 00 00       	mov    0xa14,%eax
 5be:	eb 02                	jmp    5c2 <free+0x19>
 5c0:	89 d0                	mov    %edx,%eax
 5c2:	39 c8                	cmp    %ecx,%eax
 5c4:	73 04                	jae    5ca <free+0x21>
 5c6:	39 08                	cmp    %ecx,(%eax)
 5c8:	77 12                	ja     5dc <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ca:	8b 10                	mov    (%eax),%edx
 5cc:	39 c2                	cmp    %eax,%edx
 5ce:	77 f0                	ja     5c0 <free+0x17>
 5d0:	39 c8                	cmp    %ecx,%eax
 5d2:	72 08                	jb     5dc <free+0x33>
 5d4:	39 ca                	cmp    %ecx,%edx
 5d6:	77 04                	ja     5dc <free+0x33>
 5d8:	89 d0                	mov    %edx,%eax
 5da:	eb e6                	jmp    5c2 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5dc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5df:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	39 d7                	cmp    %edx,%edi
 5e6:	74 19                	je     601 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5e8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5eb:	8b 50 04             	mov    0x4(%eax),%edx
 5ee:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5f1:	39 ce                	cmp    %ecx,%esi
 5f3:	74 1b                	je     610 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5f5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5f7:	a3 14 0a 00 00       	mov    %eax,0xa14
}
 5fc:	5b                   	pop    %ebx
 5fd:	5e                   	pop    %esi
 5fe:	5f                   	pop    %edi
 5ff:	5d                   	pop    %ebp
 600:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 601:	03 72 04             	add    0x4(%edx),%esi
 604:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 607:	8b 10                	mov    (%eax),%edx
 609:	8b 12                	mov    (%edx),%edx
 60b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 60e:	eb db                	jmp    5eb <free+0x42>
    p->s.size += bp->s.size;
 610:	03 53 fc             	add    -0x4(%ebx),%edx
 613:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 616:	8b 53 f8             	mov    -0x8(%ebx),%edx
 619:	89 10                	mov    %edx,(%eax)
 61b:	eb da                	jmp    5f7 <free+0x4e>

0000061d <morecore>:

static Header*
morecore(uint nu)
{
 61d:	55                   	push   %ebp
 61e:	89 e5                	mov    %esp,%ebp
 620:	53                   	push   %ebx
 621:	83 ec 04             	sub    $0x4,%esp
 624:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 626:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 62b:	77 05                	ja     632 <morecore+0x15>
    nu = 4096;
 62d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 632:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 639:	83 ec 0c             	sub    $0xc,%esp
 63c:	50                   	push   %eax
 63d:	e8 31 fd ff ff       	call   373 <sbrk>
  if(p == (char*)-1)
 642:	83 c4 10             	add    $0x10,%esp
 645:	83 f8 ff             	cmp    $0xffffffff,%eax
 648:	74 1c                	je     666 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 64a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 64d:	83 c0 08             	add    $0x8,%eax
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	50                   	push   %eax
 654:	e8 50 ff ff ff       	call   5a9 <free>
  return freep;
 659:	a1 14 0a 00 00       	mov    0xa14,%eax
 65e:	83 c4 10             	add    $0x10,%esp
}
 661:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 664:	c9                   	leave  
 665:	c3                   	ret    
    return 0;
 666:	b8 00 00 00 00       	mov    $0x0,%eax
 66b:	eb f4                	jmp    661 <morecore+0x44>

0000066d <malloc>:

void*
malloc(uint nbytes)
{
 66d:	f3 0f 1e fb          	endbr32 
 671:	55                   	push   %ebp
 672:	89 e5                	mov    %esp,%ebp
 674:	53                   	push   %ebx
 675:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 678:	8b 45 08             	mov    0x8(%ebp),%eax
 67b:	8d 58 07             	lea    0x7(%eax),%ebx
 67e:	c1 eb 03             	shr    $0x3,%ebx
 681:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 684:	8b 0d 14 0a 00 00    	mov    0xa14,%ecx
 68a:	85 c9                	test   %ecx,%ecx
 68c:	74 04                	je     692 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 68e:	8b 01                	mov    (%ecx),%eax
 690:	eb 4b                	jmp    6dd <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 692:	c7 05 14 0a 00 00 18 	movl   $0xa18,0xa14
 699:	0a 00 00 
 69c:	c7 05 18 0a 00 00 18 	movl   $0xa18,0xa18
 6a3:	0a 00 00 
    base.s.size = 0;
 6a6:	c7 05 1c 0a 00 00 00 	movl   $0x0,0xa1c
 6ad:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6b0:	b9 18 0a 00 00       	mov    $0xa18,%ecx
 6b5:	eb d7                	jmp    68e <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6b7:	74 1a                	je     6d3 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6b9:	29 da                	sub    %ebx,%edx
 6bb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6be:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6c1:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6c4:	89 0d 14 0a 00 00    	mov    %ecx,0xa14
      return (void*)(p + 1);
 6ca:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6cd:	83 c4 04             	add    $0x4,%esp
 6d0:	5b                   	pop    %ebx
 6d1:	5d                   	pop    %ebp
 6d2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6d3:	8b 10                	mov    (%eax),%edx
 6d5:	89 11                	mov    %edx,(%ecx)
 6d7:	eb eb                	jmp    6c4 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d9:	89 c1                	mov    %eax,%ecx
 6db:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	39 da                	cmp    %ebx,%edx
 6e2:	73 d3                	jae    6b7 <malloc+0x4a>
    if(p == freep)
 6e4:	39 05 14 0a 00 00    	cmp    %eax,0xa14
 6ea:	75 ed                	jne    6d9 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 6ec:	89 d8                	mov    %ebx,%eax
 6ee:	e8 2a ff ff ff       	call   61d <morecore>
 6f3:	85 c0                	test   %eax,%eax
 6f5:	75 e2                	jne    6d9 <malloc+0x6c>
 6f7:	eb d4                	jmp    6cd <malloc+0x60>
