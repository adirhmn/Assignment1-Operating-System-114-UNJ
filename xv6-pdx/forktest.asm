
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	53                   	push   %ebx
   8:	83 ec 10             	sub    $0x10,%esp
   b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   e:	53                   	push   %ebx
   f:	e8 35 01 00 00       	call   149 <strlen>
  14:	83 c4 0c             	add    $0xc,%esp
  17:	50                   	push   %eax
  18:	53                   	push   %ebx
  19:	ff 75 08             	pushl  0x8(%ebp)
  1c:	e8 8a 03 00 00       	call   3ab <write>
}
  21:	83 c4 10             	add    $0x10,%esp
  24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	f3 0f 1e fb          	endbr32 
  2d:	55                   	push   %ebp
  2e:	89 e5                	mov    %esp,%ebp
  30:	53                   	push   %ebx
  31:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  34:	68 3c 04 00 00       	push   $0x43c
  39:	6a 01                	push   $0x1
  3b:	e8 c0 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  40:	83 c4 10             	add    $0x10,%esp
  43:	bb 00 00 00 00       	mov    $0x0,%ebx
  48:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  4e:	7f 15                	jg     65 <forktest+0x3c>
    pid = fork();
  50:	e8 2e 03 00 00       	call   383 <fork>
    if(pid < 0)
  55:	85 c0                	test   %eax,%eax
  57:	78 0c                	js     65 <forktest+0x3c>
      break;
    if(pid == 0)
  59:	74 05                	je     60 <forktest+0x37>
  for(n=0; n<N; n++){
  5b:	83 c3 01             	add    $0x1,%ebx
  5e:	eb e8                	jmp    48 <forktest+0x1f>
      exit();
  60:	e8 26 03 00 00       	call   38b <exit>
  }

  if(n == N){
  65:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  6b:	74 12                	je     7f <forktest+0x56>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  6d:	85 db                	test   %ebx,%ebx
  6f:	7e 3b                	jle    ac <forktest+0x83>
    if(wait() < 0){
  71:	e8 1d 03 00 00       	call   393 <wait>
  76:	85 c0                	test   %eax,%eax
  78:	78 1e                	js     98 <forktest+0x6f>
  for(; n > 0; n--){
  7a:	83 eb 01             	sub    $0x1,%ebx
  7d:	eb ee                	jmp    6d <forktest+0x44>
    printf(1, "fork claimed to work N times!\n", N);
  7f:	83 ec 04             	sub    $0x4,%esp
  82:	68 e8 03 00 00       	push   $0x3e8
  87:	68 7c 04 00 00       	push   $0x47c
  8c:	6a 01                	push   $0x1
  8e:	e8 6d ff ff ff       	call   0 <printf>
    exit();
  93:	e8 f3 02 00 00       	call   38b <exit>
      printf(1, "wait stopped early\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 47 04 00 00       	push   $0x447
  a0:	6a 01                	push   $0x1
  a2:	e8 59 ff ff ff       	call   0 <printf>
      exit();
  a7:	e8 df 02 00 00       	call   38b <exit>
    }
  }

  if(wait() != -1){
  ac:	e8 e2 02 00 00       	call   393 <wait>
  b1:	83 f8 ff             	cmp    $0xffffffff,%eax
  b4:	75 17                	jne    cd <forktest+0xa4>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  b6:	83 ec 08             	sub    $0x8,%esp
  b9:	68 6e 04 00 00       	push   $0x46e
  be:	6a 01                	push   $0x1
  c0:	e8 3b ff ff ff       	call   0 <printf>
}
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cb:	c9                   	leave  
  cc:	c3                   	ret    
    printf(1, "wait got too many\n");
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	68 5b 04 00 00       	push   $0x45b
  d5:	6a 01                	push   $0x1
  d7:	e8 24 ff ff ff       	call   0 <printf>
    exit();
  dc:	e8 aa 02 00 00       	call   38b <exit>

000000e1 <main>:

int
main(void)
{
  e1:	f3 0f 1e fb          	endbr32 
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  eb:	e8 39 ff ff ff       	call   29 <forktest>
  exit();
  f0:	e8 96 02 00 00       	call   38b <exit>

000000f5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  f5:	f3 0f 1e fb          	endbr32 
  f9:	55                   	push   %ebp
  fa:	89 e5                	mov    %esp,%ebp
  fc:	56                   	push   %esi
  fd:	53                   	push   %ebx
  fe:	8b 75 08             	mov    0x8(%ebp),%esi
 101:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 104:	89 f0                	mov    %esi,%eax
 106:	89 d1                	mov    %edx,%ecx
 108:	83 c2 01             	add    $0x1,%edx
 10b:	89 c3                	mov    %eax,%ebx
 10d:	83 c0 01             	add    $0x1,%eax
 110:	0f b6 09             	movzbl (%ecx),%ecx
 113:	88 0b                	mov    %cl,(%ebx)
 115:	84 c9                	test   %cl,%cl
 117:	75 ed                	jne    106 <strcpy+0x11>
    ;
  return os;
}
 119:	89 f0                	mov    %esi,%eax
 11b:	5b                   	pop    %ebx
 11c:	5e                   	pop    %esi
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    

0000011f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11f:	f3 0f 1e fb          	endbr32 
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 12c:	0f b6 01             	movzbl (%ecx),%eax
 12f:	84 c0                	test   %al,%al
 131:	74 0c                	je     13f <strcmp+0x20>
 133:	3a 02                	cmp    (%edx),%al
 135:	75 08                	jne    13f <strcmp+0x20>
    p++, q++;
 137:	83 c1 01             	add    $0x1,%ecx
 13a:	83 c2 01             	add    $0x1,%edx
 13d:	eb ed                	jmp    12c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 13f:	0f b6 c0             	movzbl %al,%eax
 142:	0f b6 12             	movzbl (%edx),%edx
 145:	29 d0                	sub    %edx,%eax
}
 147:	5d                   	pop    %ebp
 148:	c3                   	ret    

00000149 <strlen>:

uint
strlen(char *s)
{
 149:	f3 0f 1e fb          	endbr32 
 14d:	55                   	push   %ebp
 14e:	89 e5                	mov    %esp,%ebp
 150:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 153:	b8 00 00 00 00       	mov    $0x0,%eax
 158:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 15c:	74 05                	je     163 <strlen+0x1a>
 15e:	83 c0 01             	add    $0x1,%eax
 161:	eb f5                	jmp    158 <strlen+0xf>
    ;
  return n;
}
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    

00000165 <memset>:

void*
memset(void *dst, int c, uint n)
{
 165:	f3 0f 1e fb          	endbr32 
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	57                   	push   %edi
 16d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 170:	89 d7                	mov    %edx,%edi
 172:	8b 4d 10             	mov    0x10(%ebp),%ecx
 175:	8b 45 0c             	mov    0xc(%ebp),%eax
 178:	fc                   	cld    
 179:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 17b:	89 d0                	mov    %edx,%eax
 17d:	5f                   	pop    %edi
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 18e:	0f b6 10             	movzbl (%eax),%edx
 191:	84 d2                	test   %dl,%dl
 193:	74 09                	je     19e <strchr+0x1e>
    if(*s == c)
 195:	38 ca                	cmp    %cl,%dl
 197:	74 0a                	je     1a3 <strchr+0x23>
  for(; *s; s++)
 199:	83 c0 01             	add    $0x1,%eax
 19c:	eb f0                	jmp    18e <strchr+0xe>
      return (char*)s;
  return 0;
 19e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    

000001a5 <gets>:

char*
gets(char *buf, int max)
{
 1a5:	f3 0f 1e fb          	endbr32 
 1a9:	55                   	push   %ebp
 1aa:	89 e5                	mov    %esp,%ebp
 1ac:	57                   	push   %edi
 1ad:	56                   	push   %esi
 1ae:	53                   	push   %ebx
 1af:	83 ec 1c             	sub    $0x1c,%esp
 1b2:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b5:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ba:	89 de                	mov    %ebx,%esi
 1bc:	83 c3 01             	add    $0x1,%ebx
 1bf:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c2:	7d 2e                	jge    1f2 <gets+0x4d>
    cc = read(0, &c, 1);
 1c4:	83 ec 04             	sub    $0x4,%esp
 1c7:	6a 01                	push   $0x1
 1c9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1cc:	50                   	push   %eax
 1cd:	6a 00                	push   $0x0
 1cf:	e8 cf 01 00 00       	call   3a3 <read>
    if(cc < 1)
 1d4:	83 c4 10             	add    $0x10,%esp
 1d7:	85 c0                	test   %eax,%eax
 1d9:	7e 17                	jle    1f2 <gets+0x4d>
      break;
    buf[i++] = c;
 1db:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1df:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1e2:	3c 0a                	cmp    $0xa,%al
 1e4:	0f 94 c2             	sete   %dl
 1e7:	3c 0d                	cmp    $0xd,%al
 1e9:	0f 94 c0             	sete   %al
 1ec:	08 c2                	or     %al,%dl
 1ee:	74 ca                	je     1ba <gets+0x15>
    buf[i++] = c;
 1f0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1f2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1f6:	89 f8                	mov    %edi,%eax
 1f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fb:	5b                   	pop    %ebx
 1fc:	5e                   	pop    %esi
 1fd:	5f                   	pop    %edi
 1fe:	5d                   	pop    %ebp
 1ff:	c3                   	ret    

00000200 <stat>:

int
stat(char *n, struct stat *st)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	56                   	push   %esi
 208:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	6a 00                	push   $0x0
 20e:	ff 75 08             	pushl  0x8(%ebp)
 211:	e8 b5 01 00 00       	call   3cb <open>
  if(fd < 0)
 216:	83 c4 10             	add    $0x10,%esp
 219:	85 c0                	test   %eax,%eax
 21b:	78 24                	js     241 <stat+0x41>
 21d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 21f:	83 ec 08             	sub    $0x8,%esp
 222:	ff 75 0c             	pushl  0xc(%ebp)
 225:	50                   	push   %eax
 226:	e8 b8 01 00 00       	call   3e3 <fstat>
 22b:	89 c6                	mov    %eax,%esi
  close(fd);
 22d:	89 1c 24             	mov    %ebx,(%esp)
 230:	e8 7e 01 00 00       	call   3b3 <close>
  return r;
 235:	83 c4 10             	add    $0x10,%esp
}
 238:	89 f0                	mov    %esi,%eax
 23a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 23d:	5b                   	pop    %ebx
 23e:	5e                   	pop    %esi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
    return -1;
 241:	be ff ff ff ff       	mov    $0xffffffff,%esi
 246:	eb f0                	jmp    238 <stat+0x38>

00000248 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 248:	f3 0f 1e fb          	endbr32 
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	57                   	push   %edi
 250:	56                   	push   %esi
 251:	53                   	push   %ebx
 252:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 255:	0f b6 02             	movzbl (%edx),%eax
 258:	3c 20                	cmp    $0x20,%al
 25a:	75 05                	jne    261 <atoi+0x19>
 25c:	83 c2 01             	add    $0x1,%edx
 25f:	eb f4                	jmp    255 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 261:	3c 2d                	cmp    $0x2d,%al
 263:	74 1d                	je     282 <atoi+0x3a>
 265:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 26a:	3c 2b                	cmp    $0x2b,%al
 26c:	0f 94 c1             	sete   %cl
 26f:	3c 2d                	cmp    $0x2d,%al
 271:	0f 94 c0             	sete   %al
 274:	08 c1                	or     %al,%cl
 276:	74 03                	je     27b <atoi+0x33>
    s++;
 278:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 27b:	b8 00 00 00 00       	mov    $0x0,%eax
 280:	eb 17                	jmp    299 <atoi+0x51>
 282:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 287:	eb e1                	jmp    26a <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 289:	8d 34 80             	lea    (%eax,%eax,4),%esi
 28c:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 28f:	83 c2 01             	add    $0x1,%edx
 292:	0f be c9             	movsbl %cl,%ecx
 295:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 299:	0f b6 0a             	movzbl (%edx),%ecx
 29c:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 29f:	80 fb 09             	cmp    $0x9,%bl
 2a2:	76 e5                	jbe    289 <atoi+0x41>
  return sign*n;
 2a4:	0f af c7             	imul   %edi,%eax
}
 2a7:	5b                   	pop    %ebx
 2a8:	5e                   	pop    %esi
 2a9:	5f                   	pop    %edi
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    

000002ac <atoo>:

int
atoo(const char *s)
{
 2ac:	f3 0f 1e fb          	endbr32 
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	53                   	push   %ebx
 2b6:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 2b9:	0f b6 0a             	movzbl (%edx),%ecx
 2bc:	80 f9 20             	cmp    $0x20,%cl
 2bf:	75 05                	jne    2c6 <atoo+0x1a>
 2c1:	83 c2 01             	add    $0x1,%edx
 2c4:	eb f3                	jmp    2b9 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 2c6:	80 f9 2d             	cmp    $0x2d,%cl
 2c9:	74 23                	je     2ee <atoo+0x42>
 2cb:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 2d0:	80 f9 2b             	cmp    $0x2b,%cl
 2d3:	0f 94 c0             	sete   %al
 2d6:	89 c6                	mov    %eax,%esi
 2d8:	80 f9 2d             	cmp    $0x2d,%cl
 2db:	0f 94 c0             	sete   %al
 2de:	89 f3                	mov    %esi,%ebx
 2e0:	08 c3                	or     %al,%bl
 2e2:	74 03                	je     2e7 <atoo+0x3b>
    s++;
 2e4:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 2e7:	b8 00 00 00 00       	mov    $0x0,%eax
 2ec:	eb 11                	jmp    2ff <atoo+0x53>
 2ee:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 2f3:	eb db                	jmp    2d0 <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 2f5:	83 c2 01             	add    $0x1,%edx
 2f8:	0f be c9             	movsbl %cl,%ecx
 2fb:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 2ff:	0f b6 0a             	movzbl (%edx),%ecx
 302:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 305:	80 fb 07             	cmp    $0x7,%bl
 308:	76 eb                	jbe    2f5 <atoo+0x49>
  return sign*n;
 30a:	0f af c7             	imul   %edi,%eax
}
 30d:	5b                   	pop    %ebx
 30e:	5e                   	pop    %esi
 30f:	5f                   	pop    %edi
 310:	5d                   	pop    %ebp
 311:	c3                   	ret    

00000312 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 312:	f3 0f 1e fb          	endbr32 
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	53                   	push   %ebx
 31a:	8b 55 08             	mov    0x8(%ebp),%edx
 31d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 320:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 323:	eb 09                	jmp    32e <strncmp+0x1c>
      n--, p++, q++;
 325:	83 e8 01             	sub    $0x1,%eax
 328:	83 c2 01             	add    $0x1,%edx
 32b:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 32e:	85 c0                	test   %eax,%eax
 330:	74 0b                	je     33d <strncmp+0x2b>
 332:	0f b6 1a             	movzbl (%edx),%ebx
 335:	84 db                	test   %bl,%bl
 337:	74 04                	je     33d <strncmp+0x2b>
 339:	3a 19                	cmp    (%ecx),%bl
 33b:	74 e8                	je     325 <strncmp+0x13>
    if(n == 0)
 33d:	85 c0                	test   %eax,%eax
 33f:	74 0b                	je     34c <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 341:	0f b6 02             	movzbl (%edx),%eax
 344:	0f b6 11             	movzbl (%ecx),%edx
 347:	29 d0                	sub    %edx,%eax
}
 349:	5b                   	pop    %ebx
 34a:	5d                   	pop    %ebp
 34b:	c3                   	ret    
      return 0;
 34c:	b8 00 00 00 00       	mov    $0x0,%eax
 351:	eb f6                	jmp    349 <strncmp+0x37>

00000353 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 353:	f3 0f 1e fb          	endbr32 
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	56                   	push   %esi
 35b:	53                   	push   %ebx
 35c:	8b 75 08             	mov    0x8(%ebp),%esi
 35f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 362:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 365:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 367:	8d 58 ff             	lea    -0x1(%eax),%ebx
 36a:	85 c0                	test   %eax,%eax
 36c:	7e 0f                	jle    37d <memmove+0x2a>
    *dst++ = *src++;
 36e:	0f b6 01             	movzbl (%ecx),%eax
 371:	88 02                	mov    %al,(%edx)
 373:	8d 49 01             	lea    0x1(%ecx),%ecx
 376:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 379:	89 d8                	mov    %ebx,%eax
 37b:	eb ea                	jmp    367 <memmove+0x14>
  return vdst;
}
 37d:	89 f0                	mov    %esi,%eax
 37f:	5b                   	pop    %ebx
 380:	5e                   	pop    %esi
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    

00000383 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 383:	b8 01 00 00 00       	mov    $0x1,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <exit>:
SYSCALL(exit)
 38b:	b8 02 00 00 00       	mov    $0x2,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <wait>:
SYSCALL(wait)
 393:	b8 03 00 00 00       	mov    $0x3,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <pipe>:
SYSCALL(pipe)
 39b:	b8 04 00 00 00       	mov    $0x4,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <read>:
SYSCALL(read)
 3a3:	b8 05 00 00 00       	mov    $0x5,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <write>:
SYSCALL(write)
 3ab:	b8 10 00 00 00       	mov    $0x10,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <close>:
SYSCALL(close)
 3b3:	b8 15 00 00 00       	mov    $0x15,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <kill>:
SYSCALL(kill)
 3bb:	b8 06 00 00 00       	mov    $0x6,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <exec>:
SYSCALL(exec)
 3c3:	b8 07 00 00 00       	mov    $0x7,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <open>:
SYSCALL(open)
 3cb:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <mknod>:
SYSCALL(mknod)
 3d3:	b8 11 00 00 00       	mov    $0x11,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <unlink>:
SYSCALL(unlink)
 3db:	b8 12 00 00 00       	mov    $0x12,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <fstat>:
SYSCALL(fstat)
 3e3:	b8 08 00 00 00       	mov    $0x8,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <link>:
SYSCALL(link)
 3eb:	b8 13 00 00 00       	mov    $0x13,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <mkdir>:
SYSCALL(mkdir)
 3f3:	b8 14 00 00 00       	mov    $0x14,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <chdir>:
SYSCALL(chdir)
 3fb:	b8 09 00 00 00       	mov    $0x9,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <dup>:
SYSCALL(dup)
 403:	b8 0a 00 00 00       	mov    $0xa,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <getpid>:
SYSCALL(getpid)
 40b:	b8 0b 00 00 00       	mov    $0xb,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <sbrk>:
SYSCALL(sbrk)
 413:	b8 0c 00 00 00       	mov    $0xc,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sleep>:
SYSCALL(sleep)
 41b:	b8 0d 00 00 00       	mov    $0xd,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <uptime>:
SYSCALL(uptime)
 423:	b8 0e 00 00 00       	mov    $0xe,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <halt>:
SYSCALL(halt)
 42b:	b8 16 00 00 00       	mov    $0x16,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <date>:
SYSCALL(date)
 433:	b8 17 00 00 00       	mov    $0x17,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    
