module AddThis
	class ShareLink < Liquid::Tag
		def initialize(name, params, tokens)
			super
			params = params.split(/\|/).map(&:strip)
			@service = params[0]
			@hash = params[1]
			@title = params[2]
			@teaser = params[3]
			@image = params[4]
		end

		def render(context)
			site_url = context.registers[:site].config['url']
			pubid = context.registers[:site].config['addthis_pubid']
			page_url = context.environments.first["page"]["url"]
			image = "#{site_url}#{@image}"
			url = "#{site_url}#{page_url}#{@hash}"
			link = sprintf "http://api.addthis.com/oexchange/0.8/%s/offer?url=%s&title=%s&description=%s&pubid=%s&screenshot=%s", @service, CGI::escape(url), CGI::escape(@title), CGI::escape(@teaser), CGI::escape(pubid), CGI::escape(image)
			sprintf "<a href=\"%s\" rel=\"nofollow\" class=\"share-link\" target=\"_blank\">%s</a>", link, @service
		end
	end
end

Liquid::Template.register_tag('share_link', AddThis::ShareLink)