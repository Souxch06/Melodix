.class public final Lg42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lu22;

.field public final synthetic k:J

.field public final synthetic l:Z

.field public final synthetic m:Lc52;


# direct methods
.method public constructor <init>(Lc52;Lu22;JZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lg42;->j:Lu22;

    .line 5
    .line 6
    iput-wide p3, p0, Lg42;->k:J

    .line 7
    .line 8
    iput-boolean p5, p0, Lg42;->l:Z

    .line 9
    .line 10
    iput-object p1, p0, Lg42;->m:Lc52;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lg42;->m:Lc52;

    .line 2
    .line 3
    iget-object v1, p0, Lg42;->j:Lu22;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lc52;->L(Lu22;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v2, p0, Lg42;->l:Z

    .line 9
    .line 10
    iget-wide v3, p0, Lg42;->k:J

    .line 11
    .line 12
    invoke-virtual {v0, v1, v3, v4, v2}, Lc52;->B(Lu22;JZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
