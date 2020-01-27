################################################################
#
#  			牆內用戶請注意
#  		(WARNING for users within China)
#  		--------------------------------
#
#      如果直接使用命令行的 git push 和 git pull 等等，而自己的
#  各個虛擬機配置又不夠嚴密，那麼，就存在着暴露自己的 IP 的風險。
#  當虛擬機配置不夠嚴密時，建議在虛擬機的 Linux/Unix 系統中通過
#  torsocks 進行操作，例如
#  	torsocks git pull
#  等等。然而，手工操作總是可能犯錯的，一旦犯錯就可能會被中共當局
#  追查到。為了避免這種後果，應當把這些程式化工作交給 Makefile 來
#  做。
#
#  使用方法：
#    (1) 將本地倉庫的 BRANCHES_TO_SYNC 中所列分支上推到 GitHub 和 GitLab
#      的遠端倉庫，則在命令行中執行
#		make push
#      如果需要強行推送，即，對 git push 增加選項 --force，則在命令行中執行
#      		make push-forced
#    (2) 從 GitHub 和 GitLab 的遠端倉庫下拉某些分支到本地倉庫，則
#      在命令行中執行
#		make pull
#      或
#		make fetch
#    (3) 如果本地倉庫在 GitHub 或 GitLab 上並不存在，可以用
#    		make create
#      把本地倉庫上推到上述兩個網站，以後就可以用 make pull 和
#      make push 把本地倉庫和 GitHub 和 GitLab 上的遠端倉庫同步更新
#      了。不過，在執行 make create 前，需要先登錄到 GitHub 上建立
#      一個空的倉庫；假設空倉庫的名稱為 <repo>，還需要完成下面配置
#      步驟中的 (1) 才可以執行上述的 make create 。
#
#      在進行上述操作前，要先在您的本地倉庫中的配置好遠端倉庫及對
#  應的上游分支。下面的例子是配置 GitHub 遠端倉庫以及其中的上游分
#  支的方法，對於 GitLab 和其他的遠端倉庫完全類似。
#    (1) 將 GitHub 中的倉庫命名為遠端倉庫 github:
#    		git remote add github https://github.com/<user>/<repo>.git
#      其中 <user> 是您在 GitHub 上的用戶名，<repo> 是您以 <user>
#      名義放置在 GitHub 上的倉庫名，這就是本倉庫的遠程倉庫。請
#      根據您的實際情況把 <user> 和 <repo> 填入上述命令中。
#      注意：在本文件中，命令行中的 <...> 表示需要根據具體情形去
#      替換為真實字符串的變量，替換之後不應當含有兩邊的尖括號。
#    (2) 設置本地分支在 GitHub 上的上游分支。假設本地分支 master
#      的上游分支是 <upstrm> （一般而言，<upstrm> 就是 master，和
#      本地倉庫中的對應分支有相同的名稱），則
#      		git branch --set-upstream-to=github/<upstrm> master
#      如果還需要設置其他本地分支的上游分支，方法也是類似，例如，
#      命令
#      		git branch --set-upstream-to=github/draft draft
#      會把 https://github.com/<user>/<repo> 中的分支 draft 設置
#      為本地分支 draft 的上游分支。
#    (3) 在本文件中，我們假設本地倉庫中的 master 和遠端倉庫中的
#      master 分支對應，本地倉庫中的 draft 和遠端倉庫中的 draft
#      分支對應。用戶當然可以創建新的分支。如果本地倉庫中的分支
#      <local_br> 和遠端倉庫中的分支 <remote_br> 對應，則需要把
#      本文件中的變量 BRANCHES_TO_SYNC 的值中添加一個對應的
#      		<local_br>:<remote_br>
#      例如，假設本地的 master 和 draft 兩個分支分別對應於遠端的
#      remote_master 和 remote_draft 分支，則把本文件中的
#      BRANCHES_TO_SYNC 的賦值改為
#      		BRANCHES_TO_SYNC = master:remote_master draft:remote_draft
#
################################################################

.PHONY: help clean create push push-forced pull fetch

TORSOCKS = torsocks
GIT = git

REMOTE_GITHUB = github
REMOTE_GITLAB = gitlab
BRANCHES_TO_SYNC = master draft

help:
	@head -n $$((`grep -n PHONY $(MAKEFILE_LIST) | cut --delimiter=: -f 1 | head -n 1` -1)) $(MAKEFILE_LIST) | less

clean:
	rm -f $(shell find . -name "?*~")

create:
	$(TORSOCKS) -i $(GIT) push -u $(REMOTE_GITHUB) $(BRANCHES_TO_SYNC)
	$(TORSOCKS) -i $(GIT) push -u $(REMOTE_GITLAB) $(BRANCHES_TO_SYNC)

push pull fetch:
	$(TORSOCKS) -i $(GIT) $@ $(REMOTE_GITHUB) $(BRANCHES_TO_SYNC)
	$(TORSOCKS) -i $(GIT) $@ $(REMOTE_GITLAB) $(BRANCHES_TO_SYNC)

push-forced:
	$(TORSOCKS) -i $(GIT) push --force $(REMOTE_GITHUB) $(BRANCHES_TO_SYNC)
	$(TORSOCKS) -i $(GIT) push --force $(REMOTE_GITLAB) $(BRANCHES_TO_SYNC)
