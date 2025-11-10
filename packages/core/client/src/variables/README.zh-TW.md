---
group:
  title: Client
  order: 1
---

# useVariables

## 使用方法

```ts
const { registerVariable, parseVariable } = useVariables();

// 註冊變數
registerVariable({
  name: '$user',
  // 如果確定變數中不需要按需載入 `关系欄位` 資料，则可以省略该欄位
  collectionName: 'users',
  ctx: {
    name: '张三',
    nickname: '小张',
  },
});

// 解析變數
const userName = await parseVariable('{{ $user.name }}');
console.log(userName); // '张三'
```

## 内置全局變數
在 `VariablesProvider` 內部註冊了一些全局都会用到的變數，这些變數在 `useBuiltinVariables` 中被定义，可以通過修改 `useBuiltinVariables` 的回傳值来修改内置的變數。

## 本機變數
在使用 `useVariables` 中的 `parseVariable` 方法時，除了可以根据内置的全局變數进行解析之外，还可以使用一些临時的本機變數。

```ts
const { parseVariable } = useVariables();
const localVariable = {
  name: '$user',
  // 如果確定變數中不需要按需載入 `关系欄位` 資料，则可以省略该欄位
  collectionName: 'users',
  ctx: {
    name: '张三',
    nickname: '小张',
  },
}

// 使用本機變數进行解析
const userName = await parseVariable('{{ $user.name }}', localVariable);
console.log(userName); // '张三'
```

註冊的本機變數在解析完之后会自動被銷毀，且不会影响到全局變數的值。

### useLocalVariables
该 hook 封装了一些比較通用但又不能作为全局變數的變數。
