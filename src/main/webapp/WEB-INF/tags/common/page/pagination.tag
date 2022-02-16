<div class="clearfix"></div>
  <div if="${page.getTotalPages() >1}">
    <ul class='pagination pull-right'>
      <li class="${page.isFirstPage()}? 'disabled' : ''">
        <span if='${page.isFirstPage()}'><i class="fa fa-fast-backward"></i></span>
        <a if='${not page.isFirstPage()}' href='@{${page.url}}+1'><i class="fa fa-fast-backward"></i></a>
      </li>
      <li class="${page.hasPreviousPage}? '' : 'disabled'">
        <span if='${not page.hasPreviousPage}'><i class="fa fa-chevron-left"></i></span>
        <a if='${page.hasPreviousPage}' href='@{${page.url}} + ${page.number-1}' title='Önceki'><i class="fa fa-chevron-left"></i></a>
      </li>
      <li each="item : ${page.items}" class="${item.current}? 'active' : ''">
        <span if='${item.current}' text='${item.number}'>1</span>
        <a if='${not item.current}' href='@{${page.url}} + ${item.number}'><span text='${item.number}'>1</span></a>
      </li>
      <li class="${page.hasNextPage}? '' : 'disabled'">
        <span if='${not page.hasNextPage}'><i class="fa fa-chevron-right"></i></span>
        <a if='${page.hasNextPage}' href='@{${page.url}} +${page.number+1}' title='Sonraki'><i class="fa fa-chevron-right"></i></a>
      </li>
      <li class="${page.lastPage}? 'disabled' : ''">
        <span if='${page.lastPage}'><i class="fa fa-fast-forward"></i></span>
        <a if='${not page.lastPage}' href='@{${page.url}} + ${page.totalPages}'><i class="fa fa-fast-forward"></i></a>
      </li>
    </ul>
  </div>