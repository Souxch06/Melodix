'use strict';
// Contract comparison only: preserve the historical begin method except the
// independently tested durable epoch admission and its fail-closed branch.
module.exports=function normalizeBegin(s){
 const added='    invoke-static {p0}, Lcom/melodix/music/NativeSessionStore;->advance(Landroid/content/Context;)I\n    move-result v0\n    if-ltz v0, :store_failure\n';
 const old='    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I\n    add-int/lit8 v0, v0, 0x1\n    sput v0, Lcom/melodix/music/NativeSessionGate;->generation:I\n';
 if(s.includes(added))s=s.replace(added,old);
 return s.replace(/    :store_failure\n    const\/4 v1, 0x4\n    const-string v2, "retry-launch-failed"\n    invoke-static \{v1, v2\}, Lcom\/melodix\/music\/NativeSessionGate;->transition\(ILjava\/lang\/String;\)V\n    invoke-static \{p0\}, Lcom\/melodix\/music\/NativeSessionGate;->paint\(Lcom\/melodix\/music\/MainActivity;\)V\n    return-void\n/,'');
};
