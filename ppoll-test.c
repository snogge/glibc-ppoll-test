#define _GNU_SOURCE
#include <poll.h>
#include <stddef.h>

int main(void)
{
  struct pollfd fds[2] = {0};
  struct timespec timeout = {
	.tv_sec = 0,
	.tv_nsec = 200
  };

  /* This function call will obviously fail, but that is not the point.
   * The point is to demonstrate how the linkning happens. */
  int res = ppoll(fds, sizeof(fds)/sizeof(*fds), &timeout, NULL);
  return res;
}
