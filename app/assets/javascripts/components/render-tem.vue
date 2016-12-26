<script lang="coffee">
  vm = {
    # render: (createdElement) ->
    #   createdElement('div', [
    #     createdElement('h1', 'Hi'),
    #     createdElement('my-name')])

    components:
      myName: VCompents['components/my-name']

  }
</script>

<template>
  <div>
    <div>This render-tem</div>
    <my-name></my-name>
  </div>
</template>