alias rm='rm -i -v'
alias mkcscope='find `pwd` -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files && cscope -bkq -i cscope.files'

#alias mkctags='ctags -R -I "__THROW" -I "__nonnull" --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q'
#-I CL_API_SUFFIX__VERSION_1_0 for opencl function
opencl_ignore="-I CL_API_SUFFIX__VERSION_1_0"
cuda_ctag_ignore="-I __host__ -I __global__ -I __device__ -I CUDARTAPI"
#alias mkctags='ctags -R $cuda_ctag_ignore $opencl_ignore -I __THROW -I __THROWNL -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+px --fields=+ialS --extra=+q --sort=yes '
alias mksystags='mkctags -f ~/.vim/tags/systags /usr/include /usr/local/include '
