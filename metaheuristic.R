n ??? number of tweaks desired to sample the gradient
S ??? some initial candidate solution
repeat
R ??? Tweak(Copy(S))
for n ??? 1 times do
W ??? Tweak(Copy(S))
if Quality(W) > Quality(R) then
R ??? W
if Quality(R) > Quality(S) then
S ??? R
until S is the ideal solution or we have run out of time
return S


.............................................................................................................

# I never metaheuristic I didn't like
metah <- function(S, quality, tweak, n, outer.limit, threshold)
{
  outer.n <- 0
  repeat {
    outer.n <- outer.n + 1
    R <- tweak(S)
    for(i in seq_len(n - 1))
    {
      W <- tweak(S)
      if(quality(W) > quality(R))
        R <- W
    }
    if(quality(R) > quality(S))
      S <- R
    if(quality(S) >= threshold || outer.n >= outer.limit)
      break
  }
  S
}