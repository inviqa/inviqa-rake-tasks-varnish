namespace :varnish do
  def parse_varnish_args(args)
    if args.length > 2
      args = args[2..-1]
    elsif args.length == 1
      args = args[1..-1]
    end
    args
  end

  task :log do
    args = parse_varnish_args(ARGV)
    command = 'varnishlog' + args.join(' ')
    services_from_args(services: %w[varnish]).exec(
      'root',
      "bash -c '#{command}'"
    )
    exit $?.to_i
  end
end
