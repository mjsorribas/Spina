module Spina
  module PagesHelper

    def content(part_name)
      current_page.content(part_name)
    end

    def has_content?(part_name)
      current_page.has_content?(part_name)
    end

    def current_page
      Current.page
    end

    def spina_body_tag(attributes = {}, &block)
      attributes[:data] ||= {}
      attributes[:data].merge!({current_page: current_page.id, ancestors: current_page.ancestor_ids.join('-')})
      tag.body attributes, &block
    end

  end
end