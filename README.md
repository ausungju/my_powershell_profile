<img width="736" height="284" alt="Image" src="https://github.com/user-attachments/assets/2e146387-23bf-4e88-bd8a-8ebd0956b713" />

# My PowerShell Profile

PowerShell 사용자 경험을 향상시키는 커스텀 프로필 설정입니다.

## 기능

### 커스텀 함수

- **VS()** - Visual Studio Developer Shell 실행
- **Get-ChildItemColorized** - 컬러풀한 ls 출력 (리눅스 스타일)
  - 디렉토리: 파란색
  - 실행 파일 (exe, bat, cmd, ps1): 초록색
  - 멀티 컬럼 레이아웃 지원

### 디렉토리 네비게이션

빠른 상위 디렉토리 이동:
- `..` - 1단계 상위
- `...` - 2단계 상위
- `....` - 3단계 상위
- `.....` - 4단계 상위
- `......` - 5단계 상위
- `.......` - 6단계 상위

### 앨리어스

| 앨리어스 | 명령어 | 설명 |
|---------|--------|------|
| `c` | `cls` | 화면 지우기 |
| `vim` | `nvim` | Neovim 실행 |
| `ls` | `Get-ChildItemColorized` | 컬러풀한 파일 목록 |
| `ll` | `Get-ChildItem` | 기본 파일 목록 |
| `la` | `Get-ChildItem` | 파일 목록 |
| `open` | `Invoke-Item` | 파일/폴더 열기 |

### 키 바인딩

- **Ctrl+D** - DeleteCharOrExit (빈 라인에서 셸 종료)

### 테마

[Oh My Posh](https://ohmyposh.dev/)의 robbyrussell 테마 사용

## 설치

1. 이 저장소를 클론합니다:
```powershell
git clone https://github.com/ausungju/my_powershell_profile.git
```

2. 프로필 파일을 PowerShell 프로필 위치로 복사합니다:
```powershell
Copy-Item Microsoft.PowerShell_profile.ps1 $PROFILE
```

3. Oh My Posh를 설치합니다:
```powershell
winget install JanDeDobbeleer.OhMyPosh --source winget
```

4. (선택) Neovim을 설치합니다 (vim 앨리어스 사용 시):
```powershell
winget install Neovim.Neovim
```

5. PowerShell을 재시작하거나 프로필을 다시 로드합니다:
```powershell
. $PROFILE
```

## 요구 사항

- PowerShell 7+
- Oh My Posh
- (선택) Neovim
- (선택) Visual Studio - VS() 함수 사용 시
  - 프로필의 경로는 2026 Insiders 기준으로 설정되어 있습니다
  - 다른 버전을 사용하는 경우 `Microsoft.PowerShell_profile.ps1` 파일에서 경로를 수정하세요
  - 경로 형식: `C:\Program Files\Microsoft Visual Studio\[버전]\[에디션]\Common7\Tools\Launch-VsDevShell.ps1`

