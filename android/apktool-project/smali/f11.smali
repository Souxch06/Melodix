.class public final Lf11;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public final j:Lm01;

.field public final k:Liw0;

.field public final l:Ljava/lang/String;

.field public final m:I

.field public final n:Lnb0;

.field public final o:Lsb0;

.field public final p:Lh11;

.field public final q:Lf11;

.field public final r:Lf11;

.field public final s:Lf11;

.field public final t:J

.field public final u:J

.field public final v:Lai;

.field public w:Lci;


# direct methods
.method public constructor <init>(Lm01;Liw0;Ljava/lang/String;ILnb0;Lsb0;Lh11;Lf11;Lf11;Lf11;JJLai;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lf11;->j:Lm01;

    .line 14
    .line 15
    iput-object p2, p0, Lf11;->k:Liw0;

    .line 16
    .line 17
    iput-object p3, p0, Lf11;->l:Ljava/lang/String;

    .line 18
    .line 19
    iput p4, p0, Lf11;->m:I

    .line 20
    .line 21
    iput-object p5, p0, Lf11;->n:Lnb0;

    .line 22
    .line 23
    iput-object p6, p0, Lf11;->o:Lsb0;

    .line 24
    .line 25
    iput-object p7, p0, Lf11;->p:Lh11;

    .line 26
    .line 27
    iput-object p8, p0, Lf11;->q:Lf11;

    .line 28
    .line 29
    iput-object p9, p0, Lf11;->r:Lf11;

    .line 30
    .line 31
    iput-object p10, p0, Lf11;->s:Lf11;

    .line 32
    .line 33
    iput-wide p11, p0, Lf11;->t:J

    .line 34
    .line 35
    iput-wide p13, p0, Lf11;->u:J

    .line 36
    .line 37
    iput-object p15, p0, Lf11;->v:Lai;

    .line 38
    .line 39
    return-void
.end method

.method public static g(Lf11;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lf11;->o:Lsb0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    return-object p0
.end method


# virtual methods
.method public final a()Lci;
    .locals 1

    .line 1
    iget-object v0, p0, Lf11;->w:Lci;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lci;->n:Lci;

    .line 6
    .line 7
    iget-object v0, p0, Lf11;->o:Lsb0;

    .line 8
    .line 9
    invoke-static {v0}, Lml;->x(Lsb0;)Lci;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lf11;->w:Lci;

    .line 14
    .line 15
    :cond_0
    return-object v0
.end method

.method public final close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lf11;->p:Lh11;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lh11;->close()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "response is not eligible for a body and must not be closed"

    .line 10
    .line 11
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final h()Le11;
    .locals 3

    .line 1
    new-instance v0, Le11;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lf11;->j:Lm01;

    .line 7
    .line 8
    iput-object v1, v0, Le11;->a:Lm01;

    .line 9
    .line 10
    iget-object v1, p0, Lf11;->k:Liw0;

    .line 11
    .line 12
    iput-object v1, v0, Le11;->b:Liw0;

    .line 13
    .line 14
    iget v1, p0, Lf11;->m:I

    .line 15
    .line 16
    iput v1, v0, Le11;->c:I

    .line 17
    .line 18
    iget-object v1, p0, Lf11;->l:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Le11;->d:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lf11;->n:Lnb0;

    .line 23
    .line 24
    iput-object v1, v0, Le11;->e:Lnb0;

    .line 25
    .line 26
    iget-object v1, p0, Lf11;->o:Lsb0;

    .line 27
    .line 28
    invoke-virtual {v1}, Lsb0;->d()Lrb0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Le11;->f:Lrb0;

    .line 33
    .line 34
    iget-object v1, p0, Lf11;->p:Lh11;

    .line 35
    .line 36
    iput-object v1, v0, Le11;->g:Lh11;

    .line 37
    .line 38
    iget-object v1, p0, Lf11;->q:Lf11;

    .line 39
    .line 40
    iput-object v1, v0, Le11;->h:Lf11;

    .line 41
    .line 42
    iget-object v1, p0, Lf11;->r:Lf11;

    .line 43
    .line 44
    iput-object v1, v0, Le11;->i:Lf11;

    .line 45
    .line 46
    iget-object v1, p0, Lf11;->s:Lf11;

    .line 47
    .line 48
    iput-object v1, v0, Le11;->j:Lf11;

    .line 49
    .line 50
    iget-wide v1, p0, Lf11;->t:J

    .line 51
    .line 52
    iput-wide v1, v0, Le11;->k:J

    .line 53
    .line 54
    iget-wide v1, p0, Lf11;->u:J

    .line 55
    .line 56
    iput-wide v1, v0, Le11;->l:J

    .line 57
    .line 58
    iget-object p0, p0, Lf11;->v:Lai;

    .line 59
    .line 60
    iput-object p0, v0, Le11;->m:Lai;

    .line 61
    .line 62
    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Response{protocol="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lf11;->k:Liw0;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", code="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lf11;->m:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", message="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lf11;->l:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", url="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lf11;->j:Lm01;

    .line 39
    .line 40
    iget-object p0, p0, Lm01;->a:Led0;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const/16 p0, 0x7d

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method
