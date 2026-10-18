.class public final Lo32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:J

.field public final synthetic n:Lc52;


# direct methods
.method public constructor <init>(Lc52;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lo32;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Lo32;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lo32;->l:Ljava/lang/Object;

    .line 9
    .line 10
    iput-wide p5, p0, Lo32;->m:J

    .line 11
    .line 12
    iput-object p1, p0, Lo32;->n:Lc52;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v3, p0, Lo32;->l:Ljava/lang/Object;

    .line 2
    .line 3
    iget-wide v1, p0, Lo32;->m:J

    .line 4
    .line 5
    iget-object v0, p0, Lo32;->n:Lc52;

    .line 6
    .line 7
    iget-object v4, p0, Lo32;->j:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v5, p0, Lo32;->k:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual/range {v0 .. v5}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
