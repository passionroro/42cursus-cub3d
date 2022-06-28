#include "../include/cub3d.h"

int	main(int argc, char **argv)
{
	t_data	data;
	if (argc != 2)
		return (write(2, "Error: ARGUMENTS\n", 17));
	if (map_parsing(argv[1], &data) != 0)
		return (parsing_error(argv[1], &data));
	run_cubed(&data);
}
