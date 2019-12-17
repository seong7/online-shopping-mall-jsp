# online-shopping-mall-jsp 
## Git, Github
#### Commit 규칙
<ol>
 <li>
  작업 전과 완료 후(push 전), 항상 최신 버전의 origin/dev 를 fetch 하여 업데이트 여부 확인
  <ul>
    <li>명령어 : git fetch origin</li>
  </ul>
 </li>
 <li>
  origin/master의 업데이트가 있을 경우, 우선 local branch 와 merge 하기
  <ul>
   <li>명령어 : git merge 로컬브랜치명 origin/dev</li>
  </ul>
 </li>
 <li>
   push
   <ul>
    <li>명령어 : git push origin 로컬브랜치명</li>
   </ul>
 </li>
</ol>

#### branch 관련 명령어
<ul>
  <li>
  브랜치 리스트 보기
   <ul>
    <li>명령어 : git branch</li>
    <li>remote 브랜치도 함께 보기 : git branch -a</li>
  </ul>
 </li>
 <li>
  브랜치 생성
   <ul>
    <li>명령어 : git branch 브랜치명</li>
  </ul>
 </li>
  <li>
  브랜치 이동
  <ul>
   <li>명령어 : git checkout 브랜치명</li>
  </ul>
 </li>
 <li>
  브랜치 삭제
  <ul>
   <li>명령어 : git branch -d 브랜치명</li>
  </ul>
 </li>
  <li>
  더이상 원격 repo(github)에 존재하지 않는 원격 브랜치(origin) 삭제
  <ul>
   <li>명령어 : git remote prune origin</li>
  </ul>
 </li>
 </ul>


### SQL 바로가기[./WebContent/sql/](./WebContent/sql/)
