jekyll-addthis
==============

This simple Jekyll plugin generates links to [AddThis' sharing endpoint service](http://support.addthis.com/customer/portal/articles/381265-addthis-sharing-endpoints#.UsxoUGRDtDI). The module does not introduce any Javascript functionality or CSS styling to the share links; it simply generates the HTML markup leaving styling and Javascript functionality to site builders.

## Installation and Usage

1. Place addthis.rb in your `<root>/_plugins` directory so that Jekyll can load it
2. In `_config.yml`, add your AddThis profile ID as `addthis_pubid: XZY-ID`
1. To create AddThis links in markup, use the following liquid tag: `{% share_link service|extra|title|teaser|image %}` where
    - `service` is the one of the [AddThis destinations](http://www.addthis.com/services/list). 
    - `extra` is any extra parameters to be added the the current page's URL such as querystrings.
    - `title` is the title of the share.
    - `teaser` is the teaser of the share.
    - `image` is a teaser image for Facebook sharing.
  